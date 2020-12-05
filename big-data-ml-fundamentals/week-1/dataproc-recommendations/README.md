# Lab

### Task 1 - Create Cloud SQL Instance
Through UI, go to SQL and create instance named "rentals" that uses mySQL.

### Task 2 - Load data into SQL instance

You can connect to the SQL instance using the Cloud Shell terminal or a VM. The Overview page explains how to do either.

To connect from Cloud Shell, run and type:
```sh
gcloud sql connect rentals --user=root --quiet
```
Check the databases available once connected.
```sql
SHOW DATABASES;
```
Create tables and database.
```sql
CREATE DATABASE IF NOT EXISTS recommendation_spark;

USE recommendation_spark;

DROP TABLE IF EXISTS Recommendation;
DROP TABLE IF EXISTS Rating;
DROP TABLE IF EXISTS Accommodation;

CREATE TABLE IF NOT EXISTS Accommodation
(
  id varchar(255),
  title varchar(255),
  location varchar(255),
  price int,
  rooms int,
  rating float,
  type varchar(255),
  PRIMARY KEY (ID)
);

CREATE TABLE  IF NOT EXISTS Rating
(
  userId varchar(255),
  accoId varchar(255),
  rating int,
  PRIMARY KEY(accoId, userId),
  FOREIGN KEY (accoId)
    REFERENCES Accommodation(id)
);

CREATE TABLE  IF NOT EXISTS Recommendation
(
  userId varchar(255),
  accoId varchar(255),
  prediction float,
  PRIMARY KEY(userId, accoId),
  FOREIGN KEY (accoId)
    REFERENCES Accommodation(id)
);

SHOW DATABASES;
```
Check that it worked.
```sql
USE recommendation_spark;

SHOW TABLES;
```

### Task 3 - Stage data in Cloud Storage
In a new Cloud Shell tab stage the data to GCS.
```sh
echo "Creating bucket: gs://$DEVSHELL_PROJECT_ID"
gsutil mb gs://$DEVSHELL_PROJECT_ID

echo "Copying data to our storage from public dataset"
gsutil cp gs://cloud-training/bdml/v2.0/data/accommodation.csv gs://$DEVSHELL_PROJECT_ID
gsutil cp gs://cloud-training/bdml/v2.0/data/rating.csv gs://$DEVSHELL_PROJECT_ID

echo "Show the files in our bucket"
gsutil ls gs://$DEVSHELL_PROJECT_ID

echo "View some sample data"
gsutil cat gs://$DEVSHELL_PROJECT_ID/accommodation.csv
```

### Task 4 - Load data from Cloud Storage into Cloud SQL tables
Navigate to `rentals` Cloud SQL istance, and use the UI to load the data.

### Task 5 - Explore Cloud SQL data
Run some queries.

```sql
USE recommendation_spark;

SELECT * FROM Rating
LIMIT 15;
```
```sql
SELECT
    COUNT(userId) AS num_ratings,
    COUNT(DISTINCT userId) AS distinct_user_ratings,
    MIN(rating) AS worst_rating,
    MAX(rating) AS best_rating,
    AVG(rating) AS avg_rating
FROM Rating;
```
```sql
SELECT
    userId,
    COUNT(rating) AS num_ratings
FROM Rating
GROUP BY userId
ORDER BY num_ratings DESC;
```

### Task 6 - Launch Dataproc

We are going to use Dataproc to train our model. We want to have our Dataproc cluster in the same region as our SQL instance. Our region for this run was `us-central1-b`.

We created the cluster through the UI. It was a single node master cluster with 2 worker nodes. Both used N1 VMs.

Now in the Cloud Console we run this to grant the permissions to connect our Cloud SQL to the cluster. Note you may need to change the `ZONE` variable depending on where things were created.
```sh
echo "Authorizing Cloud Dataproc to connect with Cloud SQL"
CLUSTER=rentals
CLOUDSQL=rentals
ZONE=us-central1-b
NWORKERS=2

machines="$CLUSTER-m"
for w in `seq 0 $(($NWORKERS - 1))`; do
   machines="$machines $CLUSTER-w-$w"
done

echo "Machines to authorize: $machines in $ZONE ... finding their IP addresses"
ips=""
for machine in $machines; do
    IP_ADDRESS=$(gcloud compute instances describe $machine --zone=$ZONE --format='value(networkInterfaces.accessConfigs[].natIP)' | sed "s/\['//g" | sed "s/'\]//g" )/32
    echo "IP address of $machine is $IP_ADDRESS"
    if [ -z  $ips ]; then
       ips=$IP_ADDRESS
    else
       ips="$ips,$IP_ADDRESS"
    fi
done

echo "Authorizing [$ips] to access cloudsql=$CLOUDSQL"
gcloud sql instances patch $CLOUDSQL --authorized-networks $ips
```
Get the public IP for the Cloud SQL instance.

### Task 7 - Run the ML Model
Copy the model code to GCS.
```sh
gsutil cp gs://cloud-training/bdml/v2.0/model/train_and_apply.py train_and_apply.py
cloudshell edit train_and_apply.py
```
Once the editor opens, change line 30 to the SQL instance IP, and add the root password to line 33. Save and close.

Move the edited `Python` script to Cloud Storage.
```sh
gsutil cp train_and_apply.py gs://$DEVSHELL_PROJECT_ID
```

### Task 8 - Run your ML job on Dataproc
Through the UI, submit a job to the `rentals` cluster.
Choose `PySpark` as the job and reference the `Python` script via its Cloud Storage URI as the "Main python file". Then submit the job.

### Task 9 - Explore inserted rows with SQL
Reconnect to the SQL instance.

Run this query to see the job inserting the rows from prediction.
```sql
USE recommendation_spark;

SELECT COUNT(*) as Count FROM Recommendation; 
```

Check the recommendations for a given user.
```sql 
SELECT
    r.userid,
    r.accoid,
    r.prediction,
    a.title,
    a.location,
    a.price,
    a.rooms,
    a.rating,
    a.type
FROM Recommendation as r
JOIN Accommodation as a
ON r.accoid = a.id
WHERE r.userid = 10;
```

We can see that the scores predicted are not very high, this is due to the data being insufficient.
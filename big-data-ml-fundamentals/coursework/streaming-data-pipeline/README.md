# Creating a Streaming Data Pipeline

Be sure that the default compute service account has `editor` permissions.

### Task 1 - Create a Pub/Sub topic and BigQuery dataset

> Pub/Sub is an asynchronous global messaging service. By decoupling senders and receivers, it allows for secure and highly available communication between independently written applications. Pub/Sub delivers low-latency, durable messaging. In Pub/Sub, publisher applications and subscriber applications connect with one another through the use of a shared string called a topic. A publisher application creates and sends messages to a topic. Subscriber applications create a subscription to a topic to receive messages from it.

We will be using one of Google's public Pub/Sub streaming data topics, [https://opendata.cityofnewyork.us/](NYC Taxi & Limousine Commission’s open dataset.)

> BigQuery is a serverless data warehouse. Tables in BigQuery are organized into datasets. In this lab, messages published into Pub/Sub will be aggregated and stored in BigQuery.

Open Cloud Shell and run:
```sh
bq mk taxirides
```

Create the `taxirides.realtime` table in the dataset we just created. It is a partitioned table with a defined schema.

```sh
bq mk \
--time_partitioning_field timestamp \
--schema ride_id:string,point_idx:integer,latitude:float,longitude:float,\
timestamp:timestamp,meter_reading:float,meter_increment:float,ride_status:string,\
passenger_count:integer -t taxirides.realtime
```

### Task 2 - Create a Cloud Storage bucket

> Cloud Storage allows world-wide storage and retrieval of any amount of data at any time. You can use Cloud Storage for a range of scenarios including serving website content, storing data for archival and disaster recovery, or distributing large data objects to users via direct download.

Create it with the project name (`qwiklabs-gcp-03-df7ee42d880a`) and default settings.

### Task 3 - Set up a Dataflow Pipeline

> Dataflow is a serverless way to conduct data analysis.

Done in the UI. 
1. In the Cloud Console, go to Navigation menu > Dataflow.

2. In the top menu bar, click Create job from template.

3. Enter `streaming-taxi-pipeline` as the Job name for your Dataflow job.

4. Under Dataflow template, select the Pub/Sub Topic to BigQuery template.

5. Under Input Pub/Sub topic, enter `projects/pubsub-public-data/topics/taxirides-realtime`

6. Under BigQuery output table, enter `<myprojectid>:taxirides.realtime`

7. Under Temporary location, enter `gs://<mybucket>/tmp/`

8. Click the Run Job button.

### Task 4 - Analyze the taxi data using BigQuery

We can see the data as it is streaming in. Go to BQ and run:

```sql
SELECT * FROM taxirides.realtime LIMIT 10
```

### Task 5 - Perform aggregations on the stream for reporting

You can look at metrics now.
```sql
WITH streaming_data AS (

SELECT
  timestamp,
  TIMESTAMP_TRUNC(timestamp, HOUR, 'UTC') AS hour,
  TIMESTAMP_TRUNC(timestamp, MINUTE, 'UTC') AS minute,
  TIMESTAMP_TRUNC(timestamp, SECOND, 'UTC') AS second,
  ride_id,
  latitude,
  longitude,
  meter_reading,
  ride_status,
  passenger_count
FROM
  taxirides.realtime
WHERE ride_status = 'dropoff'
ORDER BY timestamp DESC
LIMIT 100000

)

# calculate aggregations on stream for reporting:
SELECT
 ROW_NUMBER() OVER() AS dashboard_sort,
 minute,
 COUNT(DISTINCT ride_id) AS total_rides,
 SUM(meter_reading) AS total_revenue,
 SUM(passenger_count) AS total_passengers
FROM streaming_data
GROUP BY minute, timestamp
```

### Task 6 - Create a real-time dashboard

You can build a dashboard on top of this data.

### Task 7 - Create a time series dashboard

You can do even more dashboarding in Data Studio.
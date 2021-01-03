# Dataprep - Qwik Start

[Dataprep Lab](https://google.qwiklabs.com/focuses/584?parent=catalog)

#### Task 1 - Create a Bucket

Make a bucket.
```sh
gsutil mb gs://$DEVSHELL_PROJECT_ID
```

#### Task 2 - Enable Dataprep

Through the UI enable `Dataprep`.

#### Task 3 - Create a Flow

Top right corner in the UI

#### Task 4 - Import the Data

+ Click `Connect Data`

+ Click `Import Data`

+ Click `GCS`

+ Edit the path to `gs://spls/gsp105`

+ Click through and add `cn-2016.txt` and `itcont-2016.txt`.

+ Rename them to `Candidate Master 2016` and `Campaign Contributions 2016`

+ Click `Import and Add to Flow`

#### Task 5 - Prep the Candidate File

Click `Edit Recipe`.

Here we can manipulate our dataset, then once we are done save it as a recipe to run.

Using the UI you can add to the recipe the following:
+ In `column 5` filter to `2015-2020`
+ Change `column 6` to a string
+ Filter `column 7` to `P`

#### Join to Contributions File

Add a recipe to `Campaign Contributions 2016`.

Paste this into the search box 
```replacepatterns col: * with: '' on: `{start}"|"{end}` global: true```

Add a join to the recipe. Select `Candidate Master 2016` then click `Accept`.

Edit the join to be from `column 2` to `column 11`.

Click through and add it to the recipe.

#### Analysis 

Add a new step to the recipe, and paste this into the box.
```pivot value:sum(column16),average(column16),countif(column16 > 0) group: column2,column24,column8```

#### Rename Columns and Average Contribution

```rename type: manual mapping: [column24,'Candidate_Name'], [column2,'Candidate_ID'],[column8,'Party_Affiliation'], [sum_column16,'Total_Contribution_Sum'], [average_column16,'Average_Contribution_Sum'], [countif,'Number_of_Contributions']```

```set col: Average_Contribution_Sum value: round(Average_Contribution_Sum)```

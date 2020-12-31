#!/bin/bash
# Installing Git
# sudo apt-get install git -y

git clone https://www.github.com/GoogleCloudPlatform/training-data-analyst

# copy important files
cp -rf ./training-data-analyst/courses/bdml_fundamentals/ .

# clean up the giant ass repo that comes with it
rm -rf ./training-data-analyst

# start demo
cd ./bdml_fundamentals/demos/earthquakevm

# get pre-reqs
./install_missing.sh

# download data
./ingest.sh

# validate data made it
head earthquakes.csv

# analyze data
./transform.py

# list bucket contents
gsutil ls gs://ml-eng

# copy file
gsutil cp earthquakes.* gs://ml-eng
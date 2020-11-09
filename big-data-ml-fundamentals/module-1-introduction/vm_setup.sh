#!/bin/bash
# Installing Git
sudo apt-get install git -Y

git clone https://www.github.com/GoogleCloudPlatform/training-data-analyst

cd training-data-analyst/bdml-fundamentals/earthquakevm

# get pre-reqs
./install_missing.sh

# download data
./ingest_data.sh

# validate data made it
head earthquakes.csv

# analyze data
./transform.py

# list bucket contents
gsutil ls gs://ml-eng

# copy file
gsutil cp earthquakes.* gs://ml-eng
# Classifying Images of Clouds in the Cloud with AutoML Vision

### Task 1 - Set up AutoML Vision

Enable the `Cloud AutoML API`.

In Cloud Shell, use this to create a bucket.
```sh
gsutil mb -p $DEVSHELL_PROJECT_ID \
    -c regional    \
    -l us-central1 \
    gs://$DEVSHELL_PROJECT_ID-vcm/
```

Go to the [AutoML UI](https://console.cloud.google.com/vision/datasets).

### Task 2 - Upload training images to Cloud Storage

Put training images into the cloud storage bucket created before.

```sh
gsutil -m cp -r gs://cloud-training/automl-lab-clouds/* gs://$DEVSHELL_PROJECT_ID-vcm/
```

### Task 3 - Create an AutoML Vision training dataset

Update the `data.csv` with the appropriate filepath to the images for training.

```sh
gsutil cp gs://cloud-training/automl-lab-clouds/data.csv .
head --lines=10 data.csv
sed -i -e "s/placeholder/$DEVSHELL_PROJECT_ID-vcm/g" ./data.csv
head --lines=10 data.csv
gsutil cp ./data.csv gs://$DEVSHELL_PROJECT_ID-vcm/
gsutil ls gs://$DEVSHELL_PROJECT_ID-vcm/
```

Now go to the Vision API page and create a new dataset. Import the `csv` when asked how to provide the image data.

### Task 4 - Inspect the images

You can change the loaded labels for the images, and see what you have in general. You can look at "label stats" to see how many images will be used for training, testing, and validation.

### Task 5 - Train your model

Go through the steps in the UI to train the model. This will also give you the option to auto-deploy the model to one of the training nodes upon completion. You can also download the trained model for offline use. The training on just these 60 images took around an hour.

### Task 6 - Evaluate your model

Again, use the UI to explore the model results.

### Task 7 - Generate predictions

You can now upload pictures to the UI to see how the model performs.
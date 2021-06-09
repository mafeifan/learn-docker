# Stackdriver dummy exporter

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/GoogleCloudPlatform/kubernetes-engine-samples&cloudshell_workspace=custom-metrics-autoscaling/direct-to-sd&cloudshell_tutorial=README.md)

A simple sd-dummy-exporter container exports a metric of constant value to Stackdriver in a loop.
The metric name and value can be passed by flags. Pod Name and Namespace are also passed by flags.

# Build

Provided manifest files use already available images. You don't need to do
anything else to use them. The following steps are only applicable if you want to
build your own image.

1. Set TAG to build version and PROJECT to the project in which you want to host the image.

2. Build the image:

`$ docker build --pull -t gcr.io/$PROJECT/sd-dummy-exporter:$TAG .`

3. Push the image:

`$ gcloud docker -- push gcr.io/$PROJECT/sd-dummy-exporter:$TAG`

4. Edit manifest file to use image hosted in your project.

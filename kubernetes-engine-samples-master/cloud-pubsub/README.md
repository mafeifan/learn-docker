# Pub/Sub on Kubernetes Engine

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/GoogleCloudPlatform/kubernetes-engine-samples&cloudshell_tutorial=README.md&cloudshell_workspace=cloud-pubsub/)

This repository contains source code, Docker image build file and Kubernetes
manifests for Pub/Sub on Kubernetes Engine tutorial. Please follow the tutorial
at https://cloud.google.com/kubernetes-engine/docs/tutorials/authenticating-to-cloud-pubsub.

This program reads messages published on a particular topic and prints them on
standard output.

Docker image for this application is available at
`gcr.io/google-samples/pubsub-sample:v1`.

Docker Image Build and Push Guide
This guide will walk you through the steps to build and push a Docker image for the application.

Prerequisites
Docker installed on your machine.
Access to a Docker registry (Docker Hub in this case).
Steps
Build the Docker image

Navigate to the directory containing the Dockerfile and run the following command:

This command builds the Docker image using the Dockerfile in the current directory and tags it as 09078601/migrations:v1.0.2.
```
 docker build -t 09078601/migrations:v1.0.2 .
```
Push the Docker image to Docker Hub

docker push 09078601/migrations:v1.0.2

Before pushing the image, make sure you are logged in to Docker Hub. If not, you can log in using the following command:

You will be prompted to enter your Docker Hub username and password.

After logging in, you can push the image to Docker Hub using the following command:

This command pushes the 09078601/migrations:v1.0.2 image to Docker Hub.

Please replace 09078601/migrations:v1.0.2 with your actual Docker Hub username and desired image tag.
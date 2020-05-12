# docker nodejs app

Using docker to create an image and container for the nodejs app to run on.

## Docker

Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and deploy it as one package.

## Dockerfile

A dockerfile is a script with various commands and arguements listed successively to automatically perform actions on a base image (in this case ubuntu 20.04) to create a new one. In this case we use ubuntu 20.04 as our base image, then copy our app code onto the image, then install python and pip (which allows us to install the dependencies required to run the app) and then finally run the app.

## Running the app

to build an image:
```
docker build . -t nodejs_app
```
to run image:
```
docker run -d --name nodejs_app -p 80:80 -p 3000:3000 nodejs_app
```
to stop running use container id which can be found via `docker ps`:
```
docker stop nodejs_app
```
to remove container
```
docker rm nodejs_app
```

## Docker Hub

Docker Hub is a cloud-based repository in which you can create, test, store and distribute container images. We can use this to create our own repository for this Hackerank API.

### Using Docker Hub

The first thing you need to do is to create a Docker Hub account, and then create a repository and give it a name.

Once the container is running, you can push the image to the repository you created.

Then need to commit the project:

`docker commit -m 'commit message' <image_name> <username/repository_name>`

Push the project to Docker Hub:

`docker push <username/repository_name>`

My repository on Docker Hub: https://hub.docker.com/repository/docker/dilanmorar/nodejs_app

# docker nodejs app

Using docker to create an image and container for the nodejs app to run on.

## running the app

to build an image:
```
docker build -t app
```
to run image:
```
docker run -p 80:80 -p 3000:3000 app
```
to stop running use container id which can be found via `docker ps`:
```
docker stop <CONTAINER ID>
```

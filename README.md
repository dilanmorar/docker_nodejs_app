# docker nodejs app

Using docker to create an image and container for the nodejs app to run on.

## running the app

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

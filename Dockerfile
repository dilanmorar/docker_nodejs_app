FROM ubuntu:16.04

# copy app folder to directory in container/image
COPY node-sample-app /home/ubuntu/app

# Update the sources list
RUN apt-get update -y

# upgrade any packages available
RUN apt-get upgrade -y

# install nginx
RUN apt-get install nginx -y

# install nodejs
RUN apt-get install python-software-properties -y
RUN apt-get install curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install nodejs -y

# install pm2
RUN npm install pm2 -g

# go to directory to /home/ubuntu/app
WORKDIR /home/ubuntu/app

RUN npm install

# nginx reverse proxy
RUN rm /etc/nginx/sites-enabled/default
COPY environment/app/default /etc/nginx/sites-enabled/default

# specify ports
# EXPOSE 3000 80

# start nginx and app when run container
CMD service nginx start
CMD node app.js

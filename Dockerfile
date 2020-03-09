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

# change directory to /home/ubuntu/app
WORKDIR /home/ubuntu/app

RUN npm install

# Reconfigure nginx reverse proxy from default configurations
# RUN rm /etc/nginx/sites-enabled/default
# COPY environment/app/default /etc/nginx/sites-enabled/default

# start/enable nginx (enable lets it auto-start at boot time) NOTE: Docker images do not save running processes so this DOESN'T WORK
# RUN service nginx start
# RUN systemctl enable nginx

# informs Docker that the container listens on the specified network ports at runtime
EXPOSE 3000 80

# will execute this command only when you run container
CMD service nginx start && node app.js

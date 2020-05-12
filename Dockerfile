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

RUN npm install -y

RUN npm i nyc

RUN npm install express --save

RUN npm install mongoose -y

RUN npm install ejs -y

RUN npm install faker --save

RUN node seeds/seed.js

# nginx reverse proxy
RUN rm /etc/nginx/sites-enabled/default
COPY environment/app/default /etc/nginx/sites-enabled/default

# specify ports
EXPOSE 3000 80

# start nginx and app when run container
CMD service nginx start

# RUN npm install ejs mongoose express

RUN export DB_HOST=mongodb://mongo:27017/posts

RUN node seeds/seed.js

CMD node app.js

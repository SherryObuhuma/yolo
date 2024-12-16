## 1. CHOICE OF BASE IMAGE

The base image used to build the containers for both the frontend and backend of the application is 'node:16-alpine'. Why the image?
        - It is a lightweight image
        - Alpine images are much smaller than other base images thus reducing the overall size of the docker image.
        - Consumes less system memory
        - Allows for multi-stage builds

For MongoDB database - The base image used is the official 'mongo' image from Dockerhub. 

## 2. DOCKERFILE DIRECTIVES USED IN THE CREATION & RUNNING OF EACH CONTAINER
Two Dockerfiles were used in this case for both the frontend(client) and backend. I used a multi-stage build for both backend and frontend dockerfiles to exclude development dependencies and to achieve a smaller image size of below 400mbs.

            ** BACKEND DOCKERFILE

FROM node:14 AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

#Add multi-stage build
FROM alpine:3.16.7

WORKDIR /app

RUN apk update && apk add --update nodejs

COPY --from=build /usr/src/app /app

EXPOSE 5000

CMD ["node", "server.js"]         


            ** FRONTEND/CLIENT DOCKERFILE

FROM node:14-slim AS build

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

FROM alpine:3.16.7

WORKDIR /app

RUN apk update && apk add npm

COPY --from=build /usr/src/app /app

EXPOSE 3000

CMD ["npm", "start"]


## 3. DOCKER-COMPOSE NETWORKING
- I used Docker Compose to set up a bridge network between the web application and MongoDB. The `MONGO_URI` environment variable in the `web` service is configured to connect to the `db` service (MongoDB) via the internal Docker network. As demonstrated below:

services:
  backend:
    # ...
    ports:
      - "5000:5000"
    networks:
      - yolo-network

  client:
    # ...
    ports:
      - "3000:3000"
    networks:
      - yolo-network
  
  mongodb:
    # ...
    ports:
      - "27017:27017"
    networks:
      - yolo-network

networks:
  yolo-network:
    driver: bridge

## 4. DOCKER-COMPOSE VOLUME DEFINITION AND USAGE
- The volume definition in the `docker-compose.yml` file (`mongo_data:/data/db`) ensures that MongoDB's data is persistent. This means that even if the MongoDB container is stopped or removed, the data will persist in the named volume `mongo_data`. This is defined as below:

volumes:
  mongo-data:


## 5. GIT WORKFLOW TO ACHIEVE THE TASK
I forked the repository, cloned it to my local machine, and then pushed my changes to the forked repository on GitHub. 

1. Forked the repository from the original repository.
2. Clone the repository to my local machine.
3. Added Dockerfiles for both the client and backend to the repository.
4. Added the docker-compose.yml file to the repository
5. Built the client and backend images
6. Pushed the built images to my docker registry
7. Deployed the containers using docker compose up
8. Added the dockerhub.png to the repository to show successful push of images to dockerhub

The changes were made through commits that described the steps taken during implementation.


## 6. DEBUGGING MEASURES

If there were issues with the containers not running correctly, I would:
  1. Check the container status using `docker-compose ps` and ensure all services are up and running.
  

## 7. BEST PRACTICES

I tagged the Docker images to follow Docker's naming convention for ease of identification and tracking.
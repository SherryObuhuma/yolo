# Overview
This project involves the containerization and deployment of a full-stack yolo application using Docker. The main goal of this project is to demonstrate how to set up and containerize both frontend and backend using Docker and Docker Compose for easy deployment and scalability. The backend interacts with a MongoDB database, and product data added through the e-commerce form is persisted across container restarts using Docker volumes.

## Features
- User-friendly interface for adding products
- Persistent MongoDB database for storing product data
- Containerized backend and frontend using Docker and Docker Compose
- Automatic setup of MongoDB, backend, and frontend services via Docker Compose
- Products added via the e-commerce form are stored in MongoDB and persist across container restarts

## Prerequisites
To run this application locally, you must have the following installed:
- Docker
- Git
- npm
- MongoDB

## Setup Instructions
- Clone the repository to your local machine
- Navigate to the root directory of your cloned repository 
    'cd yolo'
- Launch the application using the docker compose command
    'docker compose up'
- Run the following command to install dependencies
    'npm install'
- Run the following command to start the client application on your browser
    'npm start'
- Access the client side of the application using the following URL:
    'http://localhost:3000/
- Go ahead and add a product
- Run the following command to start the backend application on you browser
    'node server.js'
- Access the backend of the application using the following URL:
    'http://localhost:5000/
- Terminate the application completely by using the docker compose command
    'docker compose down'

## More detailed steps taken in the implementation of this project are further explained in the explanation.md file



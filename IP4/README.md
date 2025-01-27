# Kubernetes Application Deployment on GKE

## Overview
This project demonstrates a distributed e-commerce system deployed on Google Kubernetes Engine (GKE). It includes a frontend, backend, and a database.

## Steps to Deploy
1. Clone the repository.
2. Build and push Docker images.
3. Apply Kubernetes manifests:
   ```bash
   kubectl apply -f manifests/
4. Access the application via the frontend LoadBalancer IP
   ```bash
   http://34.60.162.244
   

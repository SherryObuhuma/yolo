
# Explanation of the Project Structure and Execution Flow

## Playbook Execution Order

The `playbook.yml` is designed to execute tasks in a logical sequence to ensure the smooth deployment of the yolo application.

### 1. Frontend Role
- **Purpose**: Sets up the user interface for the application.
- **Tasks**:
  - Installs Docker.
  - Clones the frontend code.
  - Runs the frontend container on port 3000.
- **Reasoning**: The frontend is user facing and depends on the backend API being available, so it must start after backend and database containers are running.

### 2. Backend Role
- **Purpose**: Handles business logic and communicates with the database.
- **Tasks**:
  - Runs the backend container on port 5000.
- **Reasoning**: The backend must be operational before the frontend since it serves data to the user interface

### 3. Database Role
- **Purpose**: Stores product data and ensures persistence of the products
- **Tasks**:
  - Deploys the MongoDB container on port 27017 with Docker volumes for data persistence.
- **Reasoning**: The database must be available before the backend can perform any other operations.


## Stage 2: Terraform and Ansible Integration

### Terraform (`main.tf`)
- Provisions the Ubuntu VM.
- Executes Ansible with the `local-exec` provisioner to automate server configuration.

### Ansible (`deploy.yml`)
- Mirrors Stage 1's structure but is invoked automatically after VM provisioning.

## Ansible Modules Used

1.`apt` – Installs Docker and other packages.
2.`git` – Clones the yolo app repository.
3.`docker_container` – Deploys the frontend, backend, and database containers.
4.`docker_image` – Pulls Docker images.

## Data Persistence

- Docker volumes are mounted in the database container to ensure that product data remains intact after container restarts.

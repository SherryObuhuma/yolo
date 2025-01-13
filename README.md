# Automation of Yolo Application (An E-commerce platform) with Ansible and Terraform

## Project Overview
This project automates the deployment of a containerized e-commerce platform that is Yolo application using Ansible and Terraform. It provisions infrastructure and deploys the application with a single command.

## Prerequisites
- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Git](https://git-scm.com/downloads)

## Installation and Deployment

### Clone the Repository
```bash
git clone https://github.com/SherryObuhuma/yolo.git
cd yolo
```
## Stage 1: Ansible with Vagrant

1. Start the virtual machine:
```bash
vagrant up
```

2. Run the Ansible playbook:
```bash
ansible-playbook playbook.yml
```

3. Open the application in your browser:
```bash
http://192.168.56.10:3000
```

## Stage 2: Terraform and Ansible Integration

1. Navigate to the Stage_two branch:
```bash
cd stage_two
terraform init
terraform apply 
```

2. Open the application in your browser:
```bash
http://192.168.56.20:3000
```



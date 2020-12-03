# Cloud Kite Reliability Engineer Test

## A Realtime [To-Do CRUD App](https://neorusse.github.io/to-do/) built in-order to learn React Hooks

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

### Project Description

Project to demonstrate how to use GitHub Action Server to automate the provisioning of GKE Cluster using Terraform and also deploy app to the Cluster. Project Task Include:

- Working in GCP
- Using Terraform to provision Resources - GCP VPC, and GKE
- Building GitHub Actions pipelines
- Building Docker containers in pipelines
- Creating Kubernetes clusters (GCP GKE)
- Using GitHub Actions to implement Continuous Integration and Continuous Deployment

### Technology Used

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

Docker

Kubectl

Kustomize

GCloud cli

GitHub Actions

GCP GKE

Terraform

### Running the Todo App Locally

- Clone the Repo

- Install Project Dependencies by running:

```bash
$ npm install
```

- Start the Todo App locally

```bash
$ npm start
```

- App listens on: http://localhost:3000/

### Provision GCP GKE Cluster using Terraform

- Download Terraform GCP Provider Plugin, run

```bash
$ terraform init
```

- To see the list of GCP resources Terraform will create, run

```bash
$ terraform plan -out gke2.tfplan
```

- To create the GCP GKE Cluster, run

```bash
$ terraform apply "gke2.tfplan"
```

### How to Deploy the App to GCP GKE K8s Cluster:

### License

[MIT](https://opensource.org/licenses/MIT)

### Credit

I appreciate [Neo Ighodaro](https://www.neoighodaro.com/) who wrote an article titled: [Building a realtime to-do app using React Hooks](https://www.pusher.com/tutorials/todo-app-react-hooks) that aided my understanding of react hooks.

### Author

[Russell Nyorere](https://neorusse.github.io/)

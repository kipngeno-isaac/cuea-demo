# Simple CI/CD Demo with Docker, Nginx, and Github Actions

This repository demonstrates a **minimal end-to-end CI/CD pipeline** using **Docker**, **Nginx**, and **Github Actions**.  
The project intentionally uses a **very simple static webpage** to focus on illustrating the **build, registry, and deployment workflow** rather than application complexity.

---

## Overview

The repository contains a small static website served by **Nginx running in a Docker container**.  
A **Github Actions** automatically builds the Docker image, pushes it to the container registry, and deploys it to a remote server.

This setup demonstrates a **complete CI/CD lifecycle**:

1. Developer pushes code to the repository
2. Github Actions triggers automatically
3. Docker image is built from the `Dockerfile`
4. Image is pushed to the container registry
5. Deployment server pulls the new image
6. Container is started or updated on the server

---

## Repository Structure
```
.
├── index.html # Simple static webpage
├── Dockerfile # Builds the Nginx container
├── .github/workflows/ci.yml # CI/CD pipeline configuration
└── README.md # Project documentation
```

---

## Application

The application consists of a **single static HTML page** served by **Nginx**.

The page is packaged inside a Docker container and served via an **Nginx server running on Alpine Linux**, providing a lightweight and efficient runtime environment.

---

## Docker Setup

The `Dockerfile` builds a container using:

- **Nginx**
- **Alpine Linux base image**
- The static `index.html` copied into the default Nginx web directory

Typical responsibilities of the container:

- Start an Nginx server
- Serve the static HTML page
- Expose the HTTP port

---

## CI/CD Pipeline

The `.github/workflows/ci.yml` file defines the automated pipeline used by **Github Actions**.

### Pipeline Stages

1. **Build**
   - Builds the Docker image from the repository's `Dockerfile`.

2. **Push**
   - Tags and pushes the image to the **GitLab Container Registry**.

---

## Purpose of This Repository

This repository serves as a **minimal working example of a CI/CD pipeline** that demonstrates:

- Containerizing a web application
- Automating builds using Github Actions
- Publishing Docker images to a registry

Because the application itself is intentionally simple, the focus remains on **understanding the CI/CD workflow**.

---

## Use Cases

This project can be used for:

- Learning CI/CD fundamentals
- Demonstrating Docker build pipelines
- Testing Github Actions deployment strategies
- Teaching DevOps workflows with minimal complexity

---

## Requirements

To run or adapt this pipeline you typically need:

- Github repository
- Container Registry access
- Docker installed on the deployment server
- SSH access configured for CI/CD deployment

---

## Summary

This project demonstrates a **simple but complete DevOps workflow**:

- Static web page
- Dockerized with Nginx (Alpine base)
- Automated build and registry push
- Remote deployment via Github Actions

It provides a clear and lightweight example of **how CI/CD pipelines automate containerized application delivery**.

# Campus DevOps CI/CD Demo

![CI](https://github.com/kipngeno-isaac/cuea-demo/actions/workflows/ci.yml/badge.svg)
![Docker](https://img.shields.io/badge/Docker-Apache_Alpine-2496ED?style=flat-square&logo=docker)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI%2FCD-2088FF?style=flat-square&logo=githubactions&logoColor=white)

Demo delivered at **Catholic University of East Africa (CUEA)** as part of the Nairobi DevOps Community campus outreach programme. The app is a simple static landing page — intentionally minimal so the audience can focus on the pipeline, not the code.

---

## What this demonstrates

A complete Docker + GitHub Actions CI/CD workflow:

```
git push → GitHub Actions → docker build → tag with SHA + latest → push to registry
```

1. Developer pushes to `main`
2. GitHub Actions triggers automatically
3. Docker image is built from `Dockerfile`
4. Image is tagged with the short commit SHA (`abc1234`) and `latest`
5. Both tags are pushed to a self-hosted container registry

---

## Stack

| Component | Detail |
|---|---|
| App | Static HTML page (Tailwind CSS) served by Apache |
| Container | `httpd:2.4-alpine` — ~60 MB image |
| CI/CD | GitHub Actions — build, tag, push |
| Registry | Self-hosted (configured via repository secrets) |

---

## Repository structure

```
.
├── index.html                    # Campus DevOps Meetup landing page
├── Dockerfile                    # Apache Alpine container
└── .github/workflows/ci.yml      # Build and push pipeline
```

---

## Run locally

```bash
docker build -t cuea-demo .
docker run -p 8080:80 cuea-demo
# open http://localhost:8080
```

---

## Pipeline secrets

To use the pipeline in your own repo, set these repository secrets:

| Secret | Description |
|---|---|
| `REGISTRY_URL` | Hostname of your container registry |
| `REGISTRY_USERNAME` | Registry login username |
| `REGISTRY_PASSWORD` | Registry login password |

The pipeline tags images as `<registry>/demo/cuea-devops-web:<sha>` and `:<latest>`.

---

## Context

This repo was used as a live demo during a DevOps talk at CUEA. The pipeline pushed to a self-hosted [Gitea](https://github.com/kipngeno-isaac/self-hosted-gitea) instance running its own container registry — so students could see an alternative to GitHub/Docker Hub that a small team can self-host for free.

# Hello World app deploy

Code Format: YAML + Bash

Tech Stack: PHP + EKS + Helm + CircleCI

##########################################

This project uses CircleCI pipeline to deploy Hello World PHP application onto EKS using Helm

## Setup:
Clone this repository and set secrets in the CircleCI context. The project uses 4 secrets
- **AWS_ACCESS_KEY_ID**
- **AWS_DEFAULT_REGION**
- **AWS_ECR_ACCOUNT_URL**
- **AWS_SECRET_ACCESS_KEY**
Context being used for this project is named as *cn-standard*.

## CircleCI pipeline has below stages:

1. Build & Push Docker Image, where image is built using the Dockerfile provided under Docker directory and is pushed to a private repository in AWS ECR
2. Approval step to Deploy the app
3. Deploy the app image onto EKS using Helm using the latest image from AWS ECR (pushed in Step 1)
Since we do not have DNS records at this time, we access the application using the Load balancer directly over port 80

> Refer the below infra repository for information on provisioning infra resources on AWS: https://github.com/varshabhatnagar/cn-infra-setup.git

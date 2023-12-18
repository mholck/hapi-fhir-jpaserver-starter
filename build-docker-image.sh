#!/bin/sh

docker buildx build --platform=linux/amd64 -t icf/hapi-server .
docker tag icf/hapi-server:latest 531166169809.dkr.ecr.us-east-1.amazonaws.com/hapi_fhir:latest
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 531166169809.dkr.ecr.us-east-1.amazonaws.com
docker push 531166169809.dkr.ecr.us-east-1.amazonaws.com/hapi_fhir:latest

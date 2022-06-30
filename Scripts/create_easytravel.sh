#!/bin/sh

#!./setup_base.sh
echo "Setting up easyTravel"
kubectl create namespace easytravel

#!./create.sh
echo "Creating easyTravel"
kubectl create -f easytravel-mongodb-deployment.yaml
kubectl create -f easytravel-mongodb-service.yaml
kubectl create -f easytravel-backend-deployment.yaml
kubectl create -f easytravel-frontend-deployment.yaml
kubectl create -f easytravel-nginx-deployment.yaml

echo "Exposing easyTravel"
kubectl create -f easytravel-backend-service.yaml
kubectl create -f easytravel-frontend-service.yaml
kubectl create -f easytravel-nginx-service.yaml
echo "Waiting for 150 seconds before starting loadgen"
sleep 150
kubectl create -f easytravel-loadgen-deployment.yaml

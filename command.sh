#!/usr/bin/env bash
resourceGroup="udacity-project-two"
location="westus"
appservice="appservicenqd"

pythonVersion="3.11"

echo "Creating resource group..."
az group create -n $resourceGroup -l $location

echo "Upload source to $appservice"

az webapp up -n $appservice -g $resourceGroup --runtime "PYTHON:$pythonVersion" --sku F1 -l $location

echo "Verify app service"
az webapp show --name $appservice --resource-group $resourceGroup
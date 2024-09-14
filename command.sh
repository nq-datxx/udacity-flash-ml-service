#!/usr/bin/env bash
resourceGroup="udacity-project-two"
location="westus"
appserviceplan="appplannqd"
appservice="appservicenqd"
storageAccountName="storageaccnqd"

pythonVersion="3.11"

echo "Creating resource group..."
az group create -n $resourceGroup -l $location

# create a storage account
echo "Create storage account $storageAccountName"
az storage account create -n $storageAccountName -g $resourceGroup -l $location --sku Standard_LRS

# Create app service plan
echo "Create app service plan $appserviceplan"
az appservice plan create --name $appserviceplan --resource-group $resourceGroup --is-linux --sku F1

echo "Create app service $appservice"
az webapp create --name $appservice --resource-group $resourceGroup --plan $appserviceplan --runtime "PYTHON:$pythonVersion"

echo "Verify app service"
az webapp show --name $appservice --resource-group $resourceGroup

echo "Upload source to $appservice"
az webapp up -n $appservice
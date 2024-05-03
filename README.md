# MediaWiki Installation
Lab Exercise

## Problem Statement
We want to automate the deployment of MediaWiki using:
* Kubernetes with Helm Chart/ any equivalent automation with own Dockerfiles for application and database.
* Terraform or any IaC tool with any Configuration Management tool integrated.

Choose only one of your comfort.

* The above automation should support CI/CD practices of chosen deployment style like Rolling Update or BlueGreen Deployment. (Optional)

# Approach

The approach to solve the above problem was to use one of the IAAC tool `Bicep` with `Custom Script Extension`.

## Technologies Used
The Technologies used in this deployment are
* Bicep
* Custom Script Extension
* Shell Scripting

# Prerequisites

* Install Bicep - https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install
* Install AZ CLI - https://learn.microsoft.com/en-us/cli/azure/install-azure-cli

## Deployment Steps

Once all the prerequisites are met:

1. Convert Bicep code in to ARM Template JSON
```
    bicep build main.bicep
```
2. Deploy the resources
```
  az deployment group create --name <Deployment Name> --resource-group <RG NAME> --template-file <template_file.json>
```

### File Details
* wiki.sh                        - Bash Script.
* main.bicep                     - Bicep code for deployment.


---------------------------------------------------------------------------------------------------------------------------------------------------

- Due to time contraint the deployment is script is written as early as i can. With more time we can enhance the script and modularize it.

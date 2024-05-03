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
  
This Bicep code automates the deployment of an Azure VM with networking resources and applies custom configuration using a script that performs the installation and configuration of MediaWiki
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
## Output Generated:

![image](https://github.com/bhumanavi/bhuma/assets/168754956/ee151ea1-95ef-4c66-b4ff-402862984160)

![image](https://github.com/bhumanavi/bhuma/assets/168754956/5661fd04-7aab-4d0c-ab2e-5dca54a28600)

![image](https://github.com/bhumanavi/bhuma/assets/168754956/0e5db2c1-5b8b-4d23-a800-0e8ba687c845)


- Due to time contraint the deployment is script is written as early as i can. With more time we can enhance the script and modularize it.

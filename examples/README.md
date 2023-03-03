# Example

This folder contains an example on how to use this module to create a Kubernetes cluster on Oracle Cloud Infrastructure (OCI) Free Tier resources.

## Prerequisites

Before running this project, you must have the following:

- An OCI account with Free Tier resources available
- Terraform installed on your local machine
- OCI CLI installed on your local machine
- SSH key pair generated on your local machine

## Using the Example

1. Clone this repository to your local machine.
2. Navigate to the `example` directory.
3. Add the values in the `terraform.tfvars` template.
4. Initialize the project with the following command:
```shell
terraform init
```
5. Preview the changes that will be made with the following command:
```shell
terraform plan
```
6. Apply the changes with the following command:
```shell
terraform apply
```
Note: This command will create resources in your OCI account. Be sure to review the plan carefully before applying.

## Cleaning Up

To remove all resources created by this example, run the following command:
```shell
terraform destroy
```
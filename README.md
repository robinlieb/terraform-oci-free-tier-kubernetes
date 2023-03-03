# Terraform Module for Kubernetes Cluster on OCI Cloud Free Tier

This project uses Terraform to create a Kubernetes cluster on the Oracle Cloud Infrastructure (OCI) Free Tier resources. The cluster consists of 4 nodes: one control plane and three worker nodes. Each node uses the Arm-based Ampere A1 core and 6 GM of memory.

Note: This project is not intended to be used in production environments.

## Prerequisites

Before running this project, you must have the following:

- An OCI account with Free Tier resources available
- Terraform installed on your local machine
- OCI CLI installed on your local machine
- SSH key pair generated on your local machine

## Example

To help get started quickly with this Terraform module, I have included an example configuration in the [example folder](examples). This example demonstrates how to use the module to provision a sample infrastructure that showcases its functionality.

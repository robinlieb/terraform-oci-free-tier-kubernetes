variable "region" {
  description = "The desired region of the cluster, e.g. us-phoenix-1."
  type        = string
}

variable "compartment_id" {
  description = "The OCID of the compartment where resources will be created."
}

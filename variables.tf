variable "tenancy_ocid" {
  description = "The OCID of the tenany, e.g. ocid1.tenancy.oc1..aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa."
  type        = string
}

variable "user_ocid" {
  description = "The OCID of the user, e.g. ocid1.user.oc1..aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa."
  type        = string
}

variable "private_key" {
  description = "The private key retrieved from the Oracle account."
  type        = string
}

variable "fingerprint" {
  description = "The fingerprint of the private_key, e.g. 8c:bf:17:7b:5f:e0:7d:13:75:11:d6:39:0d:e2:84:74."
  type        = string
}

variable "region" {
  description = "The desired region of the cluster, e.g. us-phoenix-1."
  type        = string
}

variable "availability_domain" {
  description = "The availability domain in which the instance should be created, e.g Uocm:PHX-AD-1."
  type        = string
  default     = null
}

variable "ssh_public_key" {
  description = "The public key used for SSH to the instances."
  type        = string
}

variable "ssh_private_key" {
  description = "The private key used for SSH to the instances."
  type        = string
}

variable "name" {
  description = "Name will be used for compartment and kubeconfig."
  default     = "terraform-oci-free-tier-kubernetes"
}

variable "instance_shape" {
  description = "Shape of the instances."
  default     = "VM.Standard.A1.Flex"
}

variable "instance_os" {
  description = "Operating system for compute instances."
  default     = "Canonical Ubuntu"
}

variable "linux_os_version" {
  description = "Operating system version for all Linux instances."
  default     = "24.04"
}

variable "instance_ocpus" {
  description = "Number of OCPUs available to the instance."
  default     = 1
}

variable "instance_memory" {
  description = "Amount of memory available to the instance, in gigabytes."
  default     = 6
}

variable "instance_count" {
  description = "Number of instances which should be created."
  default     = 4
}

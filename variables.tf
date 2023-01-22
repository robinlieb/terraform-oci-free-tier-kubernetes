variable "tenancy_ocid" {
}

variable "user_ocid" {
}

variable "private_key" {
}

variable "fingerprint" {
}

variable "region" {
}

variable "ssh_public_key" {
}

variable "ssh_private_key" {
}

variable "name" {
  description = "Name will be used for compartment and kubeconfig"
  default     = "terraform-oci-free-tier-kubernetes"
}

variable "instance_shape" {
  description = "Instance Shape"
  default     = "VM.Standard.A1.Flex"
}

variable "instance_os" {
  description = "Operating system for compute instances"
  default     = "Canonical Ubuntu"
}

variable "linux_os_version" {
  description = "Operating system version for all Linux instances"
  default     = "22.04"
}

variable "instance_ocpus" {
  description = "Number of OCPUs available to the instance"
  default     = 1
}

variable "instance_memory" {
  description = "Amount of memory available to the instance, in gigabytes"
  default     = 6
}

variable "instance_count" {
  description = "Number of instances which should be created"
  default     = 4
}

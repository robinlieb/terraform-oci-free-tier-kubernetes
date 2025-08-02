variable "cluster_name" {
  default = "oci-free-tier-cluster"
}

variable "user_name" {
  default = "oci-free-tier-cluster-user"
}

variable "context_name" {
  default = "oci-free-tier-cluster-context"
}

variable "cluster_url" {
}

variable "ca_file" {
  sensitive = true
}

variable "client_cert_file" {
  sensitive = true
}

variable "client_key_file" {
  sensitive = true
}

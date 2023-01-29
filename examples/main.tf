provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid    = var.user_ocid
  private_key  = var.private_key
  fingerprint  = var.fingerprint
  region       = var.region
}

module "oci_kubernetes_infrastructure" {
  source = "./../"

  tenancy_ocid    = var.tenancy_ocid
  user_ocid       = var.user_ocid
  private_key     = var.private_key
  fingerprint     = var.fingerprint
  region          = var.region
  ssh_public_key  = var.ssh_public_key
  ssh_private_key = var.ssh_private_key
}

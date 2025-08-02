resource "oci_identity_compartment" "terraform_compartment" {
  compartment_id = var.tenancy_ocid
  description    = "Compartment for Terraform resources."
  name           = var.name
}

module "kubeadm_token" {
  source  = "robinlieb/kubeadm-token/random"
  version = "1.1.0"
}

module "tls" {
  source = "./modules/tls"

  common_name = "kube-ca"
}

module "kubeconfig" {
  source = "./modules/kubeconfig"

  cluster_name     = var.name
  user_name        = "${var.name}-admin"
  context_name     = var.name
  cluster_url      = "https://${module.compute.instances[0].public_ip}:6443"
  ca_file          = module.tls.ca_pem
  client_cert_file = module.tls.client_pem
  client_key_file  = module.tls.client_key
}

module "network" {
  source = "./modules/network"

  region         = var.region
  compartment_id = oci_identity_compartment.terraform_compartment.id
}


module "compute" {
  source = "./modules/compute"

  tenancy_ocid            = var.tenancy_ocid
  user_ocid               = var.user_ocid
  fingerprint             = var.fingerprint
  private_key             = var.private_key
  region                  = var.region
  availability_domain     = var.availability_domain
  instance_shape          = var.instance_shape
  instance_ocpus          = var.instance_ocpus
  instance_memory         = var.instance_memory
  instance_count          = var.instance_count
  instance_os             = var.instance_os
  linux_os_version        = var.linux_os_version
  ssh_public_key          = var.ssh_public_key
  ssh_private_key         = var.ssh_private_key
  compartment_id          = oci_identity_compartment.terraform_compartment.id
  kubeadm_token           = module.kubeadm_token.token
  ca_pem                  = module.tls.ca_pem
  ca_key                  = module.tls.ca_key
  vcn_id                  = module.network.vcn.vcn_id
  subnet_id               = module.network.vcn.subnet_id
  public_security_list_id = module.network.public_security_list_id
}

data "cloudinit_config" "config" {
  count = var.instance_count
  part {
    content_type = "text/cloud-config"
    filename     = "base.yaml"
    content = templatefile("${path.module}/cloud-config.tftpl", {
      node   = count.index,
      token  = module.kubeadm_token.token,
      ca_pem = module.tls.ca_pem,
      ca_key = module.tls.ca_key
    })
  }
}

module "kubeadm_token" {
  source  = "robinlieb/kubeadm-token/random"
  version = "1.0.0"
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
  cluster_url      = "https://${oci_core_instance.ubuntu_instance[0].public_ip}:6443"
  ca_file          = module.tls.ca_pem
  client_cert_file = module.tls.client_pem
  client_key_file  = module.tls.client_key
}

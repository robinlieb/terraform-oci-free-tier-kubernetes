data "cloudinit_config" "config" {
  count = var.instance_count
  part {
    content_type = "text/cloud-config"
    filename     = "base.yaml"
    content      = templatefile("./cloud-config.tftpl", { node = count.index, token = module.kubeadm_token.token })
  }
}

module "kubeadm_token" {
  source  = "robinlieb/kubeadm-token/random"
  version = "1.0.0"
}

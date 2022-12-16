data "cloudinit_config" "config" {
  count = var.instance_count
  part {
    content_type = "text/cloud-config"
    filename     = "base.yaml"
    content      = templatefile("./cloud-config.tftpl", { node = count.index })
  }
}

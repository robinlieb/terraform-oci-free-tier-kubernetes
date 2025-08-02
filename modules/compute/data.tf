data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

data "oci_core_images" "instance_images" {
  compartment_id           = var.compartment_id
  operating_system         = var.instance_os
  operating_system_version = var.linux_os_version
  shape                    = var.instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

data "http" "kubernetes_signing_key" {
  url = "https://pkgs.k8s.io/core:/stable:/v1.33/deb/Release.key"

  lifecycle {
    postcondition {
      condition     = contains([200], self.status_code)
      error_message = "Status code invalid"
    }
  }
}

data "http" "docker_signing_key" {
  url = "https://download.docker.com/linux/ubuntu/gpg"

  lifecycle {
    postcondition {
      condition     = contains([200], self.status_code)
      error_message = "Status code invalid"
    }
  }
}

data "cloudinit_config" "config" {
  count = var.instance_count
  part {
    content_type = "text/cloud-config"
    filename     = "base.yaml"
    content = templatefile("${path.module}/templates/cloud-config.tftpl", {
      node                   = count.index,
      token                  = var.kubeadm_token,
      ca_pem                 = var.ca_pem,
      ca_key                 = var.ca_key,
      kubernetes_signing_key = data.http.kubernetes_signing_key.response_body
      docker_signing_key     = data.http.docker_signing_key.response_body
    })
  }
}

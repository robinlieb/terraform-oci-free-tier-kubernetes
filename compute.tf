resource "oci_core_instance" "ubuntu_instance" {
  count               = var.instance_count
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = oci_identity_compartment.terraform_compartment.id
  shape               = var.instance_shape

  shape_config {
    ocpus         = var.instance_ocpus
    memory_in_gbs = var.instance_memory
  }

  source_details {
    source_id   = lookup(data.oci_core_images.instance_images.images[0], "id")
    source_type = "image"
  }

  display_name = "node${count.index}"
  create_vnic_details {
    assign_public_ip = true
    subnet_id        = count.index == 0 ? oci_core_subnet.vcn_controlplane_subnet.id : oci_core_subnet.vcn_worker_subnet.id
    private_ip = count.index == 0 ? "10.0.10.${10 + count.index}" : "10.0.20.${10 + count.index}"
  }
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data           = data.cloudinit_config.config[count.index].rendered
  }
  preserve_boot_volume = false

  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
    private_key = var.ssh_private_key
  }

  provisioner "file" {
    content = templatefile("${path.module}/scripts/init.sh",
      {
        instanceID = self.id,
      }
    )
    destination = "/tmp/init.sh"
  }

  provisioner "file" {
    content = templatefile("${path.module}/provider-config.tftpl",
      {
        region        = var.region,
        tenancy       = var.tenancy_ocid,
        user          = var.user_ocid,
        key           = var.private_key,
        fingerprint   = var.fingerprint,
        compartment   = oci_identity_compartment.terraform_compartment.id,
        vcn           = module.vcn.vcn_id,
        subnet1       = oci_core_subnet.vcn_lb_subnet.id,
        securitylist1 = oci_core_security_list.lb_sl.id,
      }
    )
    destination = "/tmp/provider-config-template.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/init.sh",
      "/tmp/init.sh",
    ]
  }

}

data "oci_core_images" "instance_images" {
  compartment_id           = oci_identity_compartment.terraform_compartment.id
  operating_system         = var.instance_os
  operating_system_version = var.linux_os_version
  shape                    = var.instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

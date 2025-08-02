resource "oci_core_instance" "ubuntu_instance" {
  count               = var.instance_count
  availability_domain = coalesce(var.availability_domain, data.oci_identity_availability_domains.ads.availability_domains[0].name)
  compartment_id      = var.compartment_id
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
    subnet_id        = var.subnet_id
    private_ip       = "10.0.0.${10 + count.index}"
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
    content = templatefile("${path.module}/templates/provider-config.tftpl",
      {
        region        = var.region,
        tenancy       = var.tenancy_ocid,
        user          = var.user_ocid,
        key           = var.private_key,
        fingerprint   = var.fingerprint,
        compartment   = var.compartment_id,
        vcn           = var.vcn_id,
        subnet1       = var.subnet_id,
        securitylist1 = var.public_security_list_id,
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


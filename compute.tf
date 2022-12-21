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
    subnet_id        = oci_core_subnet.vcn_public_subnet.id
    private_ip       = "10.0.0.${10 + count.index}"
  }
  metadata = {
    ssh_authorized_keys = var.compute_pub_ssh_key
    # user_data           = data.cloudinit_config.config[count.index].rendered
  }
  preserve_boot_volume = false
}

data "oci_core_images" "instance_images" {
  compartment_id           = oci_identity_compartment.terraform_compartment.id
  operating_system         = var.instance_os
  operating_system_version = var.linux_os_version
  shape                    = var.instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

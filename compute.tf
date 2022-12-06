resource "oci_core_instance" "ubuntu_instance" {
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = oci_identity_compartment.terraform_compartment.id
    shape = var.instance_shape

    shape_config {
        ocpus = 1
        memory_in_gbs = 6
    }

    source_details {
        source_id = lookup(data.oci_core_images.instance_images.images[0], "id")
        source_type = "image"
    }

    display_name = "node1"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.vcn_public_subnet.id
    }
    metadata = {
        ssh_authorized_keys = var.compute_pub_ssh_key
    }
    preserve_boot_volume = false
}

data "oci_core_images" "instance_images" {
    compartment_id = oci_identity_compartment.terraform_compartment.id
    operating_system = var.instance_os
    operating_system_version = var.linux_os_version
    shape = var.instance_shape
    sort_by = "TIMECREATED"
    sort_order = "DESC"
}
resource "oci_core_instance" "ubuntu_instance" {
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[1].name
    compartment_id = oci_identity_compartment.terraform_compartment.id
    shape = "VM.Standard.A1.Flex"

    shape_config {
        ocpus = 1
        memory_in_gbs = 6
    }

    source_details {
        source_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa7xlh7c3l2xtrn53n5ezp2thnac3hgjo6biolfxisk3l4igfl3xba"
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
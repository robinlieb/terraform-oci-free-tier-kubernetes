resource "oci_core_security_list" "private_security_list" {
  compartment_id = oci_identity_compartment.terraform_compartment.id
  vcn_id         = module.vcn.vcn_id

  display_name = "security-list-for-private-subnet"

  egress_security_rules {
    stateless        = false
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
  }


  ingress_security_rules {
    stateless   = false
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    protocol    = "all"
  }
}

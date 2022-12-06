resource "oci_core_subnet" "vcn_private_subnet" {
    compartment_id = oci_identity_compartment.terraform_compartment.id
    vcn_id = module.vcn.vcn_id
    cidr_block = "10.0.1.0/24"

    display_name = "private-subnet"
    security_list_ids = [oci_core_security_list.private_security_list.id]
    route_table_id = module.vcn.nat_route_id
}
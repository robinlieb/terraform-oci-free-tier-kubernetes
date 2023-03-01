resource "oci_core_subnet" "vcn_controlplane_subnet" {
  compartment_id = oci_identity_compartment.terraform_compartment.id
  vcn_id         = module.vcn.vcn_id
  cidr_block     = "10.0.10.0/24"

  display_name      = "controlplane-subnet"
  security_list_ids = [oci_core_security_list.controlplane_sl.id]
  route_table_id    = module.vcn.ig_route_id
}

resource "oci_core_subnet" "vcn_worker_subnet" {
  compartment_id = oci_identity_compartment.terraform_compartment.id
  vcn_id         = module.vcn.vcn_id
  cidr_block     = "10.0.20.0/24"

  display_name      = "worker-subnet"
  security_list_ids = [oci_core_security_list.worker_sl.id]
  route_table_id    = module.vcn.ig_route_id
}

resource "oci_core_subnet" "vcn_lb_subnet" {
  compartment_id = oci_identity_compartment.terraform_compartment.id
  vcn_id         = module.vcn.vcn_id
  cidr_block     = "10.0.30.0/24"

  display_name      = "lb-subnet"
  security_list_ids = [oci_core_security_list.lb_sl.id]
  route_table_id    = module.vcn.ig_route_id
}

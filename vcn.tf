module "vcn" {
    source = "oracle-terraform-modules/vcn/oci"
    version = "3.1.0"

    compartment_id = oci_identity_compartment.terraform_compartment.id
    region = var.region
    internet_gateway_route_rules = null
    local_peering_gateways = null
    nat_gateway_route_rules = null

    vcn_name = "vcn-module"
    vcn_dns_label = "vcnmodule"
    vcn_cidrs = ["10.0.0.0/16"]

    create_internet_gateway = true
    create_nat_gateway = false
    create_service_gateway = false
}
output "vcn" {
  value = module.vcn
}

output "public_security_list_id" {
  value = oci_core_security_list.public_sl.id
}

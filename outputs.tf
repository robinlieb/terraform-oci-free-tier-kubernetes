output "all-availability-domains" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}
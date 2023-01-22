output "ca_key" {
  value     = tls_private_key.ca_key.private_key_pem
  sensitive = true
}

output "ca_pem" {
  value     = tls_self_signed_cert.ca_cert.cert_pem
  sensitive = true
}

output "client_key" {
  value     = tls_private_key.client_key.private_key_pem
  sensitive = true
}

output "client_pem" {
  value     = tls_locally_signed_cert.client_cert.cert_pem
  sensitive = true
}

output "kubeconfig_commands" {
  value = templatefile("${path.module}/kubeconfig_commands.tftpl", {
    cluster_name     = var.cluster_name,
    cluster_url      = var.cluster_url,
    user_name        = var.user_name,
    context_name     = var.context_name,
    ca_file          = base64encode(var.ca_file),
    client_cert_file = base64encode(var.client_cert_file),
    client_key_file  = base64encode(var.client_key_file)
  })
}

output "kubeconfig" {
  value = templatefile("${path.module}/kubeconfig.tftpl", {
    cluster_name     = var.cluster_name,
    cluster_url      = var.cluster_url,
    user_name        = var.user_name,
    context_name     = var.context_name,
    ca_file          = base64encode(var.ca_file),
    client_cert_file = base64encode(var.client_cert_file),
    client_key_file  = base64encode(var.client_key_file)
  })
}

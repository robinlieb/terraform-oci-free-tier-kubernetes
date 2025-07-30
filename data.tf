data "http" "kubernetes_signing_key" {
  url = "https://pkgs.k8s.io/core:/stable:/v1.33/deb/Release.key"

  lifecycle {
    postcondition {
      condition     = contains([200], self.status_code)
      error_message = "Status code invalid"
    }
  }
}

data "http" "docker_signing_key" {
  url = "https://download.docker.com/linux/ubuntu/gpg"

  lifecycle {
    postcondition {
      condition     = contains([200], self.status_code)
      error_message = "Status code invalid"
    }
  }
}

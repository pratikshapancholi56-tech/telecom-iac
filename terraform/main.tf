provider "docker" {}

resource "docker_image" "telecom" {
  name = "telecom-app:latest"
  build {
    context = "../docker"
  }
}

resource "docker_container" "telecom_container" {
  name  = "telecom"
  image = docker_image.telecom.image_id

  ports {
    internal = 5000
    external = 5000
  }
}

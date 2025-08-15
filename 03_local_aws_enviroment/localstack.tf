resource "docker_network" "localstack_network" {
  name   = var.docker_network_name
  driver = "bridge"
}

resource "docker_volume" "localstack_volume" {
  name   = var.docker_volume_name
  driver = "local"
}

resource "docker_container" "localstack" {
  name  = "${terraform.workspace}-${var.docker_container_name}"
  image = "localstack/localstack:stable"

  env = [
    "SERVICES=sts,sqs,s3",
    "DOCKER_HOST=unix:///var/run/docker.sock",
    "AWS_DEFAULT_REGION=${var.aws_region}",
    "GATEWAY_LISTEN=${var.aws_endpoint_port}",
    "PERSISTENCE=1",
    "DATA_DIR=${var.localstack_data_dir}",
    "LAMBDA_DOCKER_NETWORK=${var.docker_network_name}",
    "LAMBDA_DOCKER_FLAGS=-v /var/run/docker.sock:/var/run/docker.sock -p 19891:19891",
    "ENVIRONMENT=${var.environment}",
    "DEBUG=1",
  ]

  networks_advanced {
    name = var.docker_network_name
  }

  ports {
    internal = var.aws_endpoint_port
    external = var.aws_endpoint_port
  }

  ports {
    internal = 4571
    external = 4571
  }

  # Docker socket mount
  volumes {
    container_path = "/var/run/docker.sock"
    host_path      = "/var/run/docker.sock"
  }

  # Localstack persistence volume mount
  volumes {
    container_path = var.localstack_data_dir
    volume_name    = var.docker_volume_name
  }

  privileged = true

  remove_volumes = true

  restart = "on-failure"

  depends_on = [
    docker_network.localstack_network,
    docker_volume.localstack_volume
  ]
}

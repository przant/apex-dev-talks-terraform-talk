resource "docker_network" "mysql_network" {
  name   = var.network_name
  driver = "bridge"
}

resource "docker_volume" "mysql_data" {
  name = var.volume_name
}

resource "docker_image" "mysql" {
  name         = "mysql:${var.mysql_version}"
  keep_locally = false
}

resource "docker_container" "mysql" {
  name  = var.container_name
  image = docker_image.mysql.image_id

  ports {
    internal = var.mysql_port
    external = var.mysql_port
  }

  env = [
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}",
    "MYSQL_DATABASE=testdb",
    "MYSQL_USER=testuser",
    "MYSQL_PASSWORD=testpass"
  ]

  volumes {
    volume_name    = docker_volume.mysql_data.name
    container_path = "/var/lib/mysql"
  }

  networks_advanced {
    name = docker_network.mysql_network.name
  }

  restart = "unless-stopped"

  healthcheck {
    test     = ["CMD", "mysqladmin", "ping", "-h", "localhost", "-u", "root", "-p${var.mysql_root_password}"]
    interval = "30s"
    timeout  = "10s"
    retries  = 3
  }
}
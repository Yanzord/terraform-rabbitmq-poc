provider "docker" {
    host = "unix:///var/run/docker.sock"
}

resource "docker_image" "rabbitmq" {
	name = "rabbitmq:${var.rabbitmq_version}-management"
}

resource "docker_container" "rabbitmq" {
	image = docker_image.rabbitmq.name
	name = "rabbitmq-server"

    env = [
        "RABBITMQ_DEFAULT_USER=${var.rabbitmq_user}", 
        "RABBITMQ_DEFAULT_PASS=${var.rabbitmq_password}"
    ]

    ports {
        internal = 15672
        external = 15672
    }

    ports {
        internal = 5672
        external = 5672
    }

	restart = "always"
}
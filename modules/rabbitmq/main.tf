provider "rabbitmq" {
    endpoint = "http://0.0.0.0:15672"
    username = var.rabbitmq_user
    password = var.rabbitmq_password
    insecure = true
}

resource "rabbitmq_vhost" "v_host" {
	name = var.rabbitmq_vhost
}

resource "rabbitmq_permissions" "user" {
	user = var.rabbitmq_user
	vhost = rabbitmq_vhost.v_host.name
	permissions {
		configure = ".*"
		write = ".*"
		read = ".*"
	}
}

resource "rabbitmq_queue" "bmf-queue" {	
	name = "bmf-queue"
	vhost = rabbitmq_vhost.v_host.name
	settings {
		durable = false
		auto_delete = true
	}
}
variable rabbitmq_user {
    default = "guest"
}

variable rabbitmq_password {
    default = "guest"
}

provider "rabbitmq" {
    endpoint = "http://0.0.0.0:15672"
    username = var.rabbitmq_user
    password = var.rabbitmq_password
    insecure = true
}

resource "rabbitmq_vhost" "vhost_1" {
	name = "vhost_1"
}

resource "rabbitmq_permissions" "guest" {
	user = "guest"
	vhost = rabbitmq_vhost.vhost_1.name
	permissions {
		configure = ".*"
		write = ".*"
		read = ".*"
	}
}

resource "rabbitmq_queue" "bmf-queue" {	
	name = "bmf-queue"
	vhost = rabbitmq_permissions.guest.vhost
	settings {
		durable = false
		auto_delete = true
	}
}
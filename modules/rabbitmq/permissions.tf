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

resource "rabbitmq_permissions" var.rabbitmq_user {
	user = var.rabbitmq_user
	vhost = var.rabbitmq_vhost
	permissions {
		configure = ".*"
		write = ".*"
		read = ".*"
	}
}
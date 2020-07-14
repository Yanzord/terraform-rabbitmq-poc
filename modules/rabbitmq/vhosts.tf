variable rabbitmq_user {
    default = "guest"
}

variable rabbitmq_password {
    default = "guest"
}

variable rabbitmq_vhost {
	default = "vhost_1"
}

provider "rabbitmq" {
    endpoint = "http://0.0.0.0:15672"
    username = var.rabbitmq_user
    password = var.rabbitmq_password
    insecure = true
}

resource "rabbitmq_vhost" var.rabbitmq_vhost {
	name = var.rabbitmq_vhost
}
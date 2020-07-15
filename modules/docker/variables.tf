variable rabbitmq_user {
    default = "guest"
}

variable rabbitmq_password {
    default = "guest"
}

variable "rabbitmq_version" {
  description = "RabbitMQ version. (3.8.x)"
  default = "3.8.5"
}
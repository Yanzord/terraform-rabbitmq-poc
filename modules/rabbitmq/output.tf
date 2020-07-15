output "bmf-queue" {
    value = rabbitmq_queue.bmf-queue.name
}

output "v_host" {
    value = rabbitmq_vhost.v_host.name
}
output "instance_ip_address" {
  description = "ID of the instance"
  value       = aws_instance.react_server.public_ip

}


output "instance_dns_address" {
  description = "The Public DNS of the instance"
  value       = aws_instance.react_server.public_dns
}

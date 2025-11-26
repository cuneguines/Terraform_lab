output "alb_dns" {
  value = aws_lb.web_alb.dns_name
}

output "ec2_public_ips" {
  value = [for instance in aws_instance.web : instance.public_ip]
}

output "application_url" {
  description = "DNS name of the Load Balancer"
  value       = "http://${aws_lb.app.dns_name}"
}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.app.name
}
variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Sample Web Application"
  type        = string
  default     = "web-app"
}

variable "aws_credentials" {
  description = "AWS credentials file path"
  type        = string
  default     = "/Users/shuvodeep/.aws/credentials"

}

variable "aws_config" {
  description = "AWS config file path"
  type        = string
  default     = "/Users/shuvodeep/.aws/config"
}

variable "environment" {
  description = "The environment for deployment"
  type        = string
  default     = "dev"
}

variable "instance_type" {
  description = "EC2 Instance Type. Restricted to T-series."
  type        = string
  default     = "t3.micro"

  # CONSTRAINT ENFORCEMENT:
  validation {
    condition     = contains(["t3.nano", "t3.micro", "t3.small", "t3.medium", "t2.micro", "t2.small"], var.instance_type)
    error_message = "Only T-series instances are allowed in this environment."
  }
}

variable "asg_max_size" {
  description = "Max instances in ASG. Capped to prevent vCPU limit violation."
  type        = number
  default     = 2

  # CONSTRAINT ENFORCEMENT: Max 10 vCPUs total. t3.micro = 2 vCPU. Max instances = 5.
  validation {
    condition     = var.asg_max_size <= 3
    error_message = "Max size cannot exceed 3. Account limit is 10 vCPUs total (2 vCPU per instance)."
  }
}
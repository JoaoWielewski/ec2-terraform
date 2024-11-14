variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2's type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "EC2's AMI"
  type        = string
  default     = "ami-0984f4b9e98be44bf"
}
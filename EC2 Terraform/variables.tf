
variable "aws_machine_type" {
  description = "Machine type for AWS EC2 instances"
  default     = "t2.micro"
}

variable "aws_key_name" {
  description = "Name of the AWS key pair"
  default     = "test"
}
variable "instance_name" {
  description = "Name of the instance"
  default     = "Maldonado-ec2"
}

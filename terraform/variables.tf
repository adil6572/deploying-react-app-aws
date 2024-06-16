variable "aws_region" {
  description = "Region of the AWS "
  default     = "us-east-1"
}


variable "instance_name" {
  description = "Name of the instance"
  default     = "react-server"

}


variable "instance_type" {
  description = "Type of the instance"
  default     = "t2.micro"

}
variable "key_name" {
  description = "Key name of the pair"

}

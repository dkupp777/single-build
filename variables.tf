#------Test/variables.tf-----
variable "aws_region" {}

variable "key_name" {}

variable "public_key_path" {}

variable "instance_count" {}

variable "instance_type" {}

variable "security_group" {
    type = "list"
}
variable "subnets" {}

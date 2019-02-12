aws_region = "us-west-2"
project_name = "Test"
vpc_cidr = "10.123.0.0/16"
subnets = "subnet-04925f2b0fde205dc"
accessip = "0.0.0.0/0"
key_name = "tf_key"
public_key_path = "/home/ec2-user/.ssh/id_rsa.pub"
instance_type = "t2.micro"
instance_count = 1
security_group = [
    "sg-027154083b7fd9280"
]
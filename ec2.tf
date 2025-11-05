# Creating ec2 vm
resource "aws_instance" "example" {
  # ami = "ami-0a25a306450a2cba3"
  ami = var.anjali-ami-id
  instance_type = var.vm-size
  key_name      = var.ec2-key-name
  # changing tags_all to tags
  tags = {
    "Name" = var.vm-name
  }
}

resource "local_file" "anjali-data" {
  content  = aws_instance.example.public_ip
  filename = "${path.module}/myip.txt"
  # Making manual dependency
  depends_on = [aws_instance.example]
}
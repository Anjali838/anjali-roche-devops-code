# Creating ec2 vm
resource "aws_instance" "example" {
  # ami = "ami-0a25a306450a2cba3"
  ami = var.anjali-ami-id
  instance_type = var.vm-size
  key_name = aws_key_pair.example.key_name
  # changing tags_all to tags
  tags = {
    "Name" = var.vm-name
  }

  # Provisioner
  provisioner "remote-exec" {
    inline = [ 
      "sudo dnf install git httpd -y",
      "mkdir -p hello/terraform"
     ]
  }
  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    timeout = "3m"
    # Content of private key data
    private_key = tls_private_key.example.private_key_pem
  }
}

resource "local_file" "anjali-data" {
  content  = aws_instance.example.public_ip
  filename = "${path.module}/myip.txt"
  # Making manual dependency
  depends_on = [aws_instance.example]
}



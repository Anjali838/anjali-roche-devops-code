
# RSA key of size 4096 bits
resource "tls_private_key" "example" {
  algorithm = var.private-key-algo
  rsa_bits  = var.key-size
}

# Save my private key
resource "local_file" "private-key-data" {
  content  = tls_private_key.example.private_key_pem
  # path.modules mean where we are writting terraform tf file
  filename = "${path.module}/anjali-key.pem"
  file_permission = 0400
  # Making manual dependency
  depends_on = [tls_private_key.example]
}

# Sending public key to aws
resource "aws_key_pair" "example" {
  key_name   = "roche-anjali-key"
  public_key = tls_private_key.example.public_key_openssh
}
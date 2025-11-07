# public up of my ec2 vm
output "my-ec2-publicIP" {
  value = aws_instance.example[*].public_ip
}

# ec2 machine instance id

output "my-ec2ID" {
  value = aws_instance.example[*].id
}

resource "local_file" "my_output_file" {
  content    = "[anjali-roche]\n${join("\n",aws_instance.example[*].public_ip)}"
  filename   = "${path.module}/ansible-inventory.txt"
  depends_on = [aws_instance.example]
}
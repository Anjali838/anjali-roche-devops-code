# public up of my ec2 vm
output "my-ec2-publicIP" {
    value = aws_instance.example.public_ip
}

# ec2 machine instance id

output "my-ec2ID" {
    value = aws_instance.example.id
}
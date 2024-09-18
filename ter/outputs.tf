# Output the public IP address of the EC2 instance
output "EC2_HOST" {
  value = aws_instance.new_instance.public_ip
}

# Output the username (adjust if necessary)
output "EC2_USERNAME" {
  value = "ec2-user"  # Common username for Amazon Linux, adjust as necessary
}

# Note: It's generally not a good practice to output sensitive data like private keys.
# Instead, you should securely manage your private key and reference it appropriately.
# Assuming you're using the default key pair, you can output the key name if needed.

# Output the key name (if you're using a key pair)
output "EC2_KEY_NAME" {
  value = aws_instance.new_instance.key_name
}

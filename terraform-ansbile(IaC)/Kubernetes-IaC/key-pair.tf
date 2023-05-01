resource "aws_key_pair" "chave_kubernetes_aws" {
  key_name   = "your-key-name"
  public_key = file("your-key-name.pub")
  }
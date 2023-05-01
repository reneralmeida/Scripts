output "instancia_kubernetes-t2g2-backend_public" {
  value = aws_instance.kubernetes-t2g2-backend.*.public_ip
}
output "instancia_kubernetes-t2g2-backend_private" {
  value = aws_instance.kubernetes-t2g2-backend.*.private_ip
}
output "instancia_t2grupo2-ansible" {
  value = aws_instance.t2grupo2-ansible.*.public_ip
}
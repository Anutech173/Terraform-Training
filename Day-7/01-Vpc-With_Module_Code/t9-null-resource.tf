resource "null_resource" "example" {

  depends_on = [
    module.bastion_instance
  ]
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = "${path.module}/private-key.pem"
    host        = aws_eip.elastic_ip.public_ip
  }
  provisioner "file" {
    source      = "${path.module}/private-key.pem"
    destination = "/tmp/private-key.pem"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/private-key.pem"
    ]
  }
  provisioner "local-exec" {
    command = "echo ${aws_eip.elastic_ip.public_ip} > bastion-ip.txt"
  }
}
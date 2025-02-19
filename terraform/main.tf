provider "local" {}

resource "local_file" "wslconfig" {
  filename = pathexpand("~/.wslconfig")
  content  = <<-EOT
    [wsl2]
    memory=64GB
    processors=8
    swap=4GB
    localhostForwarding=true
  EOT
}

resource "null_resource" "ansible_provision" {
  provisioner "local-exec" {
    command = "ANSIBLE_CONFIG=../ansible ansible-playbook -i ../ansible/inventory ../ansible/setup.yml"
  }
}
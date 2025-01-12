provider "virtualbox" {}

resource "vagrant_vm" "devops_vm" {
  name   = "devops-vm"
  box    = "geerlingguy/ubuntu2004"
  memory = 2048
  cpus   = 2
  network {
    type   = "private_network"
    ip     = "192.168.56.20"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y python3 python3-pip"
    ]
  }

  provisioner "local-exec" {
  command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i '${self.network[0].ip},' /home/Assignments/yolo/stage_two/ansible/deploy.yml -u vagrant --private-key ~/.vagrant.d/insecure_private_key"
}

}

output "vm_ip" {
  value = "192.168.56.20"
}

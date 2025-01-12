terraform {
  required_providers {
    virtualbox = {
      source  = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

provider "virtualbox" {}

resource "null_resource" "vagrant_vm" {
  provisioner "local-exec" {
    command = <<EOT
      vagrant init geerlingguy/ubuntu2004
      vagrant up
    EOT
  }

  provisioner "remote-exec" {
  connection {
      type        = "ssh"
      user        = "vagrant"
      private_key = file("~/.vagrant.d/insecure_private_key")
      host        = "192.168.56.20"
    }
    
    inline = [
      "sudo apt update -y",
      "sudo apt install -y python3 python3-pip"
    ]
  }
}

resource "digitalocean_droplet" "minecraft" {
  image = "debian-9-x64"
  name = "minecraft"
  region = "lon1"
  size = "s-2vcpu-2gb"
  private_networking = true
  ssh_keys = [
    data.digitalocean_ssh_key.id_rsa.id
  ]
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install dependecies
      "sudo apt update",
      # "sudo apt-get -y upgrade",
      "sudo apt -y install openjdk-8-jdk zip"
      # "sudo apt-get -y install zip",
    ]
  }
}
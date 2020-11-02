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
      "sudo apt-get update",
      "sudo apt-get -y install openjdk-8-jdk",
      "sudo apt-get -y install zip awscli",

      # AWS credentials
      "export AWS_ACCESS_KEY_ID=${var.AWS_ACCESS_KEY_ID}",
      "export AWS_SECRET_ACCESS_KEY=${var.AWS_SECRET_ACCESS_KEY}",
      "export AWS_DEFAULT_REGION=${var.AWS_DEFAULT_REGION}",

      # Download backup
      "aws s3 cp s3://${var.AWS_S3_BUCKET_NAME}/${var.AWS_S3_BACKUP_NAME}.zip ${var.AWS_S3_BACKUP_NAME}.zip",
      "mkdir ${var.AWS_S3_BACKUP_NAME}",
      "unzip ${var.AWS_S3_BACKUP_NAME}.zip -d ${var.AWS_S3_BACKUP_NAME}",
      "cd ${var.AWS_S3_BACKUP_NAME}",
    ]
  }
}
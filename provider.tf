terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "1.22.2"
    }
  }
}

variable "do_token" {}
variable "pvt_key" {}
variable "BACKUP_NAME" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "id_rsa" {
  name = "id_rsa"
}
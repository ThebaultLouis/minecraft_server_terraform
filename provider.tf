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
# AWS
variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}
variable "AWS_DEFAULT_REGION" {}
variable "AWS_S3_BUCKET_NAME" {}
variable "AWS_S3_BACKUP_NAME" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "id_rsa" {
  name = "id_rsa"
}
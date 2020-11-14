# Minecraft Server x Terraform x Digital Ocean

If it is your first time using terraform or digital ocean, I would recommand you to follow the Setup section steps before the Usage section steps.

# Configuration
- Configure your server in *init_world/server.properties*
- Change the server region in *minecraft.tf* and in region (https://www.digitalocean.com/docs/platform/availability-matrix/)
- Configure the server size in *minecraft.tf* and in size (https://www.digitalocean.com/pricing/)

# Usage
## If you want to execute in one command
1. Setup your credentials in *script/credential.sh*
2. Init your credentials
```sh
. ./script/credentials.sh
```
1. Init your world if you don't have one
```sh
./script/init_world.sh
```
4. Deploy your server
```sh
./deploy
```
5. In the server bash, save the game
```sh
save-all
```
6. Destroy your server
```sh
./script/destroy.sh
```

# Setup
All the digital ocean and terraform steps are inspired from the follwing tutorial https://github.com/ThebaultLouis/minecraft_server_terraform
## Account setup
### Digital Ocean
1. Create an account on Digital Ocean (https://m.do.co/c/bedbca3642a8)
2. Go on API -> Tokens/keys
3. Generate new Personnal access tokens (PAT) and save it
4. Go on Settings -> Security
5. Add your ssh key and remember the name of the new tab ('id_rsa' or 'terraform' for exemple)
6. Change "id_rsa" in *provider.tf* by the name of you ssh key
```tf
data "digitalocean_ssh_key" "id_rsa" {
  name = "id_rsa"
}
```

## Software setup
### Terraform
```sh
curl -o ~/terraform.zip https://releases.hashicorp.com/terraform/0.13.1/terraform_0.13.1_linux_amd64.zip 
mkdir -p ~/opt/terraform
sudo apt install unzip zip
unzip ~/terraform.zip -d ~/opt/terraform
nano ~/.bashrc
export PATH=$PATH:~/opt/terraform
. .bashrc
terraform
```
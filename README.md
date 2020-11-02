# Minecraft Server x Terraform x Digital Ocean x AWS S3

If it is your first time using terraform, digital ocean or AWS, I would recommand you to follow the Setup section steps before the Usage section steps.

# Configuration
- Configure your server in *init_world/server.properties*
- Change the server region in *minecraft.tf* and in region (https://www.digitalocean.com/docs/platform/availability-matrix/)
- Configure the server size in *minecraft.tf* and in size (https://www.digitalocean.com/pricing/)

# Usage
## If you want to execute in one command
1. Setup your credentials in *script/credential.sh*
2. 
If you want to start a new server
```sh
./install_from_zero.sh
```
Else
```sh
./install_from_backup.sh
```
3.  Start the server with
```sh
./start.sh
```
4. In the server bash, save the game with
```sh
save-all
```
5.  Save your game in S3 with
```sh
./save.sh
```
6. Exit your ssh shell with
```sh
exit
```
7.  Destroy your server with
```sh
./script/destroy.sh
```

## If you want to execute step by step
1. Setup your credentials in *script/credential.sh*
2. Execute the following command in the project root
```sh
. ./script/credentials.sh
```
3. Configure your server in *init_world/*
4. Upload it in first time with
```sh
./script/upload_init_world.sh
```
5. Init your terraform project with
```sh
./script/init.sh
```
6. Start your terraform project with
```sh
./script/start.sh
```
7. Know your server properties with
```sh
./script/log.sh
```
8. Connect to you server in ssh with
```sh
./script/connect_to_ssh.sh
```
9.  Start the server with
```sh
./start.sh
```
10. In the server bash, save the game with
```sh
save-all
```
11. Save your game in S3 with
```sh
./save.sh
```
12. Exit your ssh shell with
```sh
exit
```
13. Destroy your server with
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

### AWS
1. Create an account on AWS (https://aws.amazon.com/fr/premiumsupport/knowledge-center/create-and-activate-aws-account/)
2. Don't forget to change your Region (eu-west-1 is the best for french citizens)
3. Generate your aws keys and save them (AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY) in 'My security credentials'/'Mes identifiants de sécurité' -> 'Dashboard'/'Tableau de bord' -> 'Access keys'/'Clés d'accès'
4. Click on Services and enter 'S3'
5. Create a new bucket and save the bucket name (AWS_BUCKET_NAME)

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
### AWS CLI
```sh
sudo apt-get -y install awscli
```
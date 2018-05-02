# Alastria standalone
Setup Alastria test-net using [this repo](https://github.com/alastria/test-environment/tree/master/infrastructure/testnet)

## Requisites
You need [Vagrant](https://www.vagrantup.com/) to execute this script. See the following link for more info
* [Download Vagrant](https://www.vagrantup.com/downloads.html)
* [Vagrant getting started](https://www.vagrantup.com/intro/getting-started/project_setup.html)

## Install
To install all dependencies and run the Alastria test-net execute the command
```bash
$ vagrant up --provision-with shell
```
This command start a VM using your default *provider* and install all things using [this script](provision.sh)


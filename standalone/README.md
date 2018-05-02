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
> **Tip** See next section if you are behind proxy

This command start a VM using your default *provider* and install all things using [this script](provision.sh)

## Install behind proxy
If you want to install the Alastria test-net behind a proxy you need to make some changes. First, create these environment variables:

* `VAGRANT_HTTP_PROXY`: To point to `http://user:password@host:port`
* `VAGRANT_NO_PROXY`: e.g. `127.0.0.1,localhost,::1`

Also you need to install this plugin to Vagrant:

```bash
$ vagrant plugin install vagrant-proxyconf
```
And now, you can safely install all dependencies and start
```bash
$ vagrant up --provision-with shell
```

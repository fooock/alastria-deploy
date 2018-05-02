# Alastria standalone installation
Setup Alastria test-net using [this repo](https://github.com/alastria/test-environment/tree/master/infrastructure/testnet)

## Requisites
You need [Vagrant](https://www.vagrantup.com/) and one virtualization provider (virtualbox, hyperv etc) to execute this script. See the following links for more info:
* [Download Vagrant](https://www.vagrantup.com/downloads.html)
* [Vagrant getting started](https://www.vagrantup.com/intro/getting-started/project_setup.html)
* [Download VirtualBox](https://www.virtualbox.org/)

## Customize the build
At this moment the [provision.sh](provision.sh) script creates only one validator and one gateway. You can change this config editing the 
file manually, for example, if you want to create 1 validator node and 2 regular nodes:
```diff
- ./bin/start_network.sh clean 1 1
+ ./bin/start_network.sh clean 1 2
```

## Install
To install all dependencies and run the Alastria test-net execute the command
```bash
$ vagrant up --provision-with shell
```
> **Tip** See next section if you are behind proxy

This command start a VM using your default *provider* and install all things using [this script](provision.sh). This
will take a little... :coffee:

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
Another :coffee:

## Verify test-net started
To check if all has started correctly see the logs. If you see some like this, all is correct
```bash
default: [*] Spreading permissioned nodes config files
default: [*] Generating nodes in environment
default: [*] Starting validator nodes
default: [!!] Excecute from alastria test-environment/infrastructure/testnet/
default: [*] Starting main
default: Verify if /opt/test-environment/infrastructure/testnet/logs/ have new files.
default: [*] Starting gw nodes
default: [!!] Excecute from alastria test-environment/infrastructure/testnet/
default: [*] Starting general1
default: netcat: connect to localhost port 9001 (tcp) failed: Connection refused
default: netcat: connect to localhost port 9001 (tcp) failed: Connection refused
default: netcat: connect to localhost port 9001 (tcp) failed: Connection refused
default: netcat: connect to localhost port 9001 (tcp) failed: Connection refused
default: netcat: connect to localhost port 9001 (tcp) failed: Connection refused
default: Connection to localhost 9001 port [tcp/*] succeeded!
default: [*] constellation node at 9001 is now up.
default: Verify if /opt/test-environment/infrastructure/testnet/logs/ have new files.
```

Also, you can use `netstat` command to see sockets listening:

```bash
vagrant@ubuntu-xenial:~$ netstat -ntpl
(Not all processes could be identified, non-owned process info
 will not be shown, you would have to be root to see it all.)
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:9001            0.0.0.0:*               LISTEN      -
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -
tcp6       0      0 :::21000                :::*                    LISTEN      -
tcp6       0      0 :::21001                :::*                    LISTEN      -
tcp6       0      0 :::22000                :::*                    LISTEN      -
tcp6       0      0 :::22001                :::*                    LISTEN      -
tcp6       0      0 :::22                   :::*                    LISTEN      -
vagrant@ubuntu-xenial:~$
```

## How to test it?
First ssh into the machine

```bash
$ vagrant ssh
```

When done, check that `constellation`, `geth` etc are running
```bash
$ ps aux | grep testnet
```
If all is ok, we can see multiple processes.

Create new account using `geth`

```bash
$ geth account new
```

and now attach to a node, for example

```bash
$ sudo su
$ geth attach ./network/general1/geth.ipc
```

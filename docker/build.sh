
# uninstall old versions
sudo apt-get remove docker docker-engine docker.io

# update and install
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# add dokcer official GPG key
if [ -n $http_proxy ]; then
    curl -fsSL --proxy $http_proxy https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
else
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
fi

# verify key
sudo apt-key fingerprint 0EBFCD88

# setup stable repo
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# update and install
sudo apt-get update
sudo apt-get install -y docker-ce

# manage docker as non root user
sudo groupadd docker
sudo usermod -aG docker $USER
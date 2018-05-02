# Configure git to use the proxy, only if needed
if [ -n $http_proxy ]; then
    git config --global http.proxy $http_proxy
    # update wget config to add proxy support
    echo "use_proxy=on" >> /etc/wgetrc
    echo "http_proxy=$http_proxy" >> /etc/wgetrc
    echo "https_proxy=$http_proxy" >> /etc/wgetrc
fi
cd /opt

# Remove any existing directory
rm -rf test-environment

# Clone the repo and cd into it
git clone --depth 1 https://github.com/alastria/test-environment.git
cd test-environment/infrastructure/testnet

# Install dependencies
./bin/bootstrap.sh

# If the dependencies installation was successful, start the local
# test-net with one validator and one gateway
if [ $? -eq 0 ]; then
    echo [+] Dependencies installed correctly
    ./bin/start_network.sh clean 1 1
else
    echo [-] Error installing dependencies
fi

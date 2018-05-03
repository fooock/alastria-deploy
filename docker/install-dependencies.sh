
# Proxy settings
https_proxy=$1

# Configure git to use the proxy, only if needed
if [ -n $https_proxy ]; then
    git config --global http.proxy $https_proxy
    # update wget config to add proxy support
    echo "use_proxy=on" >> /etc/wgetrc
    echo "http_proxy=$https_proxy" >> /etc/wgetrc
    echo "https_proxy=$https_proxy" >> /etc/wgetrc
fi
cd /opt

# Remove any existing directory
rm -rf alastria-node

# Clone the repo and cd into it
git clone --depth 1 https://github.com/fooock/alastria-node.git
cd alastria-node/

# Install dependencies
sudo ./scripts/bootstrap.sh

# If the dependencies installation was successful, start the local
# test-net with one validator and one gateway
if [ $? -eq 0 ]; then
    echo [+] Dependencies installed correctly
else
    echo [-] Error installing dependencies
fi

# Remove downloaded files
cd .. && rm -rf alastria-node

# Clone Alastria test environment
git clone --depth 1 https://github.com/alastria/test-environment

#! /bin/bash

sudo apt update
sudo apt install docker docker-compose
export MYUSER=$(whoami)
sudo usermod -aG docker $MYUSER
exec sg docker newgrp `id -gn`
git clone https://github.com/GeoDB-limited/odin-testnet-public-tools
cd odin-testnet-public-tools/node
rm -rf config/node_key.json config/priv_validator_key.json
./start.sh
sleep 15
./export.sh
mkdir ~/odin/
cp -R config/ ~/odin/
sudo iptables-save > ~/initial_iptables_backup.txt
export IPADDRESS=$(docker inspect node | grep IPAddress | grep 172 | cut -d"\"" -f4)
export SOCKET="$(docker inspect node | grep IPAddress | grep 172 | cut -d"\"" -f4):26656"
export SOCKET2="$(docker inspect node | grep IPAddress | grep 172 | cut -d"\"" -f4):26657"
sudo iptables -t nat -A DOCKER -p tcp --dport 26656 -j DNAT --to-destination $SOCKET && sudo iptables -t nat -A POSTROUTING -j MASQUERADE -p tcp --source $IPADDRESS --destination 26656 && sudo iptables -A DOCKER -j ACCEPT -p tcp --destination $IPADDRESS --dport 26656
sudo iptables -t nat -A DOCKER -p tcp --dport 26657 -j DNAT --to-destination $SOCKET2 && sudo iptables -t nat -A POSTROUTING -j MASQUERADE -p tcp --source $IPADDRESS --destination 26657 && sudo iptables -A DOCKER -j ACCEPT -p tcp --destination $IPADDRESS --dport 26657
sudo iptables-save > ~/26656_26657_opened.txt
cd ../..
sleep 20
echo "alias odin='docker exec -it node bandd'" >> ~/.bashrc && alias odin='docker exec -it node bandd'
odin status
echo "your node is started, and ports have been forwarded.  press enter to continue"
read
./ragnarok.sh

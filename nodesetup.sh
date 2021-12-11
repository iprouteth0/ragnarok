#!/bin/sh
VERSION=${VERSION:-v0.1.0}
NODENAME=${1:-"$(hostname)"}
USER=odin
P_HOME=/home/odin
ODIN_DIR=$P_HOME/.odin
CHAIN="odin-mainnet-freya"
GENESIS_HASH="29d248a3852038b06879031d557e2cbc1e17f6fdb1c9ac00e3c52ea9ee03ed8a"

echo "-----------------------------------------------------------------------------------"
echo "HELLO THERE! This is one-liner script to install and run your Odin Protocol node"
echo "-----------------------------------------------------------------------------------"
echo

# Check for ubuntu 20.04
grep -q 'DISTRIB_CODENAME=focal' /etc/lsb-release 2>&1 > /dev/null
if [ $? -ne 0 ]; then
  echo "ERROR! You should run this script on Ubuntu 20.04!"
fi;

if [ "x$NODENAME" == "x" ]; then
 NODENAME=`hostname`
fi

# Install depencies if needed
(which sudo && which curl && which wget && which tar ) > /dev/null || \
	(apt update && apt install -y curl wget tar sudo)

echo "1. Creating user $USER"
useradd -mU $USER || true

#apt update
#apt upgrade -y
#apt install -y curl
echo 2. Downloading BINARY file to /usr/local/bin/odind
for file in odind yoda; do
	rm -f /usr/local/bin/${file}.bak
	mv -f /usr/local/bin/${file} /usr/bin/${file}.bak
	curl -sL https://mercury-nodes.net/odin/${file}-$VERSION -o /usr/local/bin/$file
	chmod +x /usr/local/bin/${file}
done
curl -sL https://mercury-nodes.net/odin/libgo_owasm.so -o /usr/lib/libgo_owasm.so


if [ ! -d $P_HOME/.odin ]; then
	echo "Initialize your fresh ODIN instalation"
	echo "Your node name is: $NODENAME"
	echo ---------------------------------
	echo

	sudo -u $USER /usr/local/bin/odind init $NODENAME --chain-id $CHAIN
	echo Downloading GENESIS file
	sudo -u $USER curl -sL https://raw.githubusercontent.com/ODIN-PROTOCOL/networks/master/mainnets/odin-mainnet-freya/final_genesis.json -o $ODIN_DIR/config/genesis.json
	echo "$GENESIS_HASH $ODIN_DIR/config/genesis.json" | sha256sum -c
	echo RESET Odin data
	sudo -u $USER /usr/local/bin/odind unsafe-reset-all
	sudo -u $USER /usr/local/bin/odind unsafe-reset-all

	#echo Set default chain-id to $CHAIN
	#/usr/local/bin/odind config chain-id $CHAIN

	echo "Validate genesis"
	sudo -u $USER /usr/local/bin/odind validate-genesis || exit

	echo Adding seeds
	SEEDS=`curl -sL https://raw.githubusercontent.com/ODIN-PROTOCOL/networks/master/mainnets/odin-mainnet-freya/seeds.txt | awk '{print $1}' | paste -s -d, -`
	sudo -u $USER sed -i.bak -e "s/^seeds =.*/seeds = \"$SEEDS\"/" $ODIN_DIR/config/config.toml
	echo Adding 15 RANDOM persistent peers
	PEERS=`curl -sL  https://raw.githubusercontent.com/ODIN-PROTOCOL/networks/master/mainnets/odin-mainnet-freya/peers.txt | grep -o "^[0-9a-f@,.:].*" | sort -R | head -n 15 | awk '{print $1}' | paste -s -d, -`
	sudo -u $USER sed -i.bak -e "s/^persistent_peers *=.*/persistent_peers = \"$PEERS\"/" $ODIN_DIR/config/config.toml

	echo Set minimal-gas-prices to 0.0125loki
	sudo -u $USER sed -i.bak 's/^minimum-gas-prices *=.*$/minimum-gas-prices = "0.0125loki"/' $ODIN_DIR/config/app.toml
fi


#echo Change max inbound and outbound peers in config
#sudo -u $USER sed -i 's/^max_num_inbound_peers =.*/max_num_inbound_peers = 80/' $ODIN_DIR/config/config.toml
#sudo -u $USER sed -i 's/^max_num_outbound_peers =.*/max_num_outbound_peers = 20/' $ODIN_DIR/config/config.toml


[ -f /etc/systemd/system/odind.service ] || cat > /etc/systemd/system/odind.service << EOF
[Unit]
Description=Odin Node
After=network-online.target
Wants=network-online.target

[Service]
User=$USER
WorkDir=$P_HOME
ExecStart=/usr/local/bin/odind start
Restart=always
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable odind
systemctl restart odind
echo -n Starting node 5 sec .
for i in 1 2 3 4; do sleep 1; echo -n '.'; done; echo 
systemctl status odind

echo "-----------------------------------------------------------------------------------"
echo "DONE!"
echo 
echo "Best Regards! Mercury nodes team"
echo "-----------------------------------------------------------------------------------"

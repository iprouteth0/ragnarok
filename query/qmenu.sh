#!/bin/bash
# Copyright (C) 2021 iprouteth0 software
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#

#functions
account() {
  # ginna Build menu
dialog --title "bandd status" --msgbox "$(docker exec -it node bandd status)" 40 90

}

auction() {
. delegate.sh
}

auth() {
# undelegate menu
. undelegate.sh
}

bank() {
  # check balance
dialog --title "Balances" --msgbox "$(docker exec -it node bandd query bank balances $ADDRESS)" 40 90
}

block() {
  # sending menu
. sendmenu.sh
}

coinswap() {
  # query menu
. qmenu.sh
}

distribution() {
  # voting menu
votemenu.sh
}

evidence() { 
# unjail
#dialog --title "unjail" --msgbox "$(docker exec -it node bandd tx slashing unjail --from $(bandd keys show $ADDRESS --bech val -a) --chain-id $CHAIN --node http://34.77.171.169:26657 )" 40 90
#docker exec -it node "bandd tx slashing unjail --from $(docker exec -it node bandd keys show $ADDRESS --bech val -a) --chain-id $CHAIN --node http://34.77.171.169:26657"
#read
. unjail.sh
}

gov() {
  # yoda menu
echo toast
}

ibc() {
  # keys menu
echo toast
}

mint() {
  # TX menu
echo toast
}

oracle() {
echo toast
}

params() {
echo toast 
}

slashing() {
echo toast
}

staking() {
echo toast
}

telemetry() {
echo toast
}

tendermint() {
echo toast
}

tx() {
echo toast
}

#section1

populatevars() {
#
. varsmenu.sh
}

adddevice() {
  # Add device to menu using scripts
  . AddDevice.sh
}

###############

HEIGHT=30
WIDTH=50
CHOICE_HEIGHT=8
BACKTITLE="RAGNAROK"
TITLE="Query Menu"
MENU="Choose one of the following options:"

OPTIONS=(
1 "Account"                                             
2 "Auction"
3 "Auth" 
4 "Bank"
5 "Block"
6 "Coinswap"
7 "Distribution"
8 "Evidence"
9 "Gov"
10 "IBC"
11 "Mint"
12 "Oracle"
13 "Params"
14 "Slashing"
15 "Staking"
16 "Telemetry"
17 "Tendermint-validator-set""
18 "TX"
19 "Upgrade"
#section2
98 "Enter node details"
99 "Add device to menu"
0 "Go Back to Main"
)

while [[ ! $CHOICE = 0 ]]; do
    CHOICE=$(dialog --clear \
                    --backtitle "$BACKTITLE" \
                    --title "$TITLE" \
                    --menu "$MENU" \
                    $HEIGHT $WIDTH $CHOICE_HEIGHT \
                    "${OPTIONS[@]}" \
                    2>&1 >/dev/tty)



case $CHOICE in
1 )
  # Motorola ginna build menu
  clear
  BEGIN=$(date +%s)
  status
  END=$(date +%s)
  clear
;;
#############################################################

2 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  delegate
  END=$(date +%s)
  clear
;;
###############################################################

3 )
  # Xiaomi Olivelite build menu
  clear
  BEGIN=$(date +%s)
  undelegate
  END=$(date +%s)
  clear
;;

###############################################################

4 )
  # Xiaomi Olivelite build menu
  clear
  BEGIN=$(date +%s)
  balance
  END=$(date +%s)
  clear
;;

#############################################################
5 )
  # samsung beyond0qlte build menu
  clear
  BEGIN=$(date +%s)
  send
  END=$(date +%s)
  clear
;;
#############################################################
6 )
  # samsung beyond1qlte build menu
  clear
  BEGIN=$(date +%s)
  query
  END=$(date +%s)
  clear
;;
#############################################################
7 )
  # samsung beyond2qlte build menu
  clear
  BEGIN=$(date +%s)
  vote
  END=$(date +%s)
  clear
;;
#############################################################
8 )
  # samsung d1q build menu
  clear
  BEGIN=$(date +%s)
  unjail
  END=$(date +%s)
  clear
;;
#############################################################
9 )
  # samsung d2q build menu
  clear
  BEGIN=$(date +%s)
  yoda
  END=$(date +%s)
  clear
;;
#############################################################
10 )
  # Motorola edge s codename nio
  clear
  BEGIN=$(date +%s)
  keys
  END=$(date +%s)
  clear
;;
##############################################################
11 )
  # Motorola G8 power codename sofiaR
  clear
  BEGIN=$(date +%s)
  tx
  END=$(date +%s)
  clear
;;
##########################################################
# section4
#############################################################
98 )
  # generate device sources script
  clear
  BEGIN=$(date +%s)
  populatevars
  END=$(date +%s)
  clear
;;
###
99 )
  # Add device to build menu
  clear
  BEGIN=$(date +%s)
  adddevice
  END=$(date +%s)
  clear
;;
#############################################################
#############################################################
0 ) 
  # Return To Main Menu
#  cd ${SOURCE2}
  ./RomMenu.sh
;; 
* ) clear
    echo "Wrong Choice AssFace, 1-3 or 0 to Return to Main Menu"
    sleep 1
    echo " "
    echo "4"
    sleep 1
    echo "3"
    sleep 1
    echo "2"
    sleep 1
    echo "1"
    sleep 1
    clear
    esac
dqone
###########################################################





qaccount.sh
qauction.sh
qauth.sh
qbank.sh
qblock.sh
qcoinswap.sh
qdistribution.sh
qevidence.sh
qgov.sh
qibc.sh

qmint.sh
qoracle.sh
qparams.sh
qslashing.sh
qstaking.sh
qtelemetry.sh
qtendermint.sh
qtx.sh
qupgrade.sh

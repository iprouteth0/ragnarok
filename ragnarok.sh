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
status() {
  # ginna Build menu
dialog --title "odind status" --msgbox "$(odind status)" 40 90

}

delegate() {
. delegate.sh
}

undelegate() {
# undelegate menu
. undelegate.sh
}

balance() {
  # check balance
mkdir tmp
dialog --backtitle "Balances query menu" --title "Balances query form" \
--form "\npopulate balances query form" 15 90 7 \
"Wallet:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/balances.tmp \
2>&1 >/dev/tty
# Start retrieving each line from temp file 1 by one with sed and
# declare variables as inputs
export ADDRESS=`sed -n 1p tmp/balances.tmp`
export CHAIN=`sed -n 2p tmp/balances.tmp`
odind query bank balances $ADDRESS --chain-id $CHAIN --node http://34.77.171.169:26657
echo "press enter to continue"
read
# remove temporary file created
rm -f tmp/balances.tmp
}

send() {
  # sending menu
. sendmenu.sh
}

query() {
  # query menu
. query/qmenu.sh
read
}

vote() {
  # voting menu
votemenu.sh
}

unjail() { 
# unjail
#dialog --title "unjail" --msgbox "$(odind tx slashing unjail --from $(bandd keys show $ADDRESS --bech val -a) --chain-id $CHAIN )" 40 90
#odind tx slashing unjail --from $(odind keys show $ADDRESS --bech val -a) --chain-id $CHAIN "
#read
. unjail.sh
}

yoda() {
  # yoda menu
echo toast
}

keys() {
  # keys menu
echo toast
}

tx() {
  # TX menu
echo toast
}

create-validator() {
rm -rf tmp
mkdir tmp
dialog --backtitle "create validator delegate menu" --title "create validator delegate form" \
--form "\npopulate create validator delegate form" 15 90 7 \
"Wallet address:" 1 1 "" 1 25 70 120  \
"Moniker:" 2 1 "" 2 25 70 120 \
"Stake(12345loki):" 3 1 "" 3 25 70 120 \
"chain-id:" 4 1 "" 4 25 70 120 > tmp/validator.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export ADDRESS=`sed -n 1p tmp/validator.tmp`
export MONIKER=`sed -n 2p tmp/validator.tmp`
export STAKE=`sed -n 3p tmp/validator.tmp`
export CHAIN=`sed -n 4p tmp/validator.tmp`
export SHOWVALIDATOR=$(docker exec -it node bandd tendermint show-validator)
odind tx staking create-validator \ 
--amount 1000000loki \ 
--commission-max-change-rate "0.05" \ 
--commission-max-rate "0.10" \ 
--commission-rate "0.05" \ 
--min-self-delegation "1" \ 
--details "validators write bios too" \ 
--pubkey $(odind tendermint show-validator) \ 
--moniker $MONIKER \ 
--chain-id $CHAIN \ 
--fees 2500loki \
--from $ADDRESS
sleep 5
exit
echo "press enter to continue"
read
# remove temporary file created
rm -rf tmp/validator.tmp
}

#section1

populatevars() {
#
. varsmenu.sh
}

nodesetup() {
  # Add device to menu using scripts
  ./nodesetup.sh
read
}

###############

HEIGHT=30
WIDTH=50
CHOICE_HEIGHT=8
BACKTITLE="RAGNAROK"
TITLE="Node Menu"
MENU="Choose one of the following options:"

OPTIONS=(
1 "Status"                                             
2 "Delegate"
3 "Undelegate" 
4 "Balance"
5 "Send"
6 "Query"
7 "Vote"
8 "Unjail"
9 "Yoda"
10 "Keys"
11 "TX"
12 "create validator"
#section2
98 "Enter node details"
99 "Initial node setup"
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
##############################################################
12 )
  # Motorola G8 power codename sofiaR
  clear
  BEGIN=$(date +%s)
  create-validator
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
  nodesetup
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
done
###########################################################



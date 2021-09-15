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
  # account query menu
. query/qaccount.sh
}

auction() {
. query/qauction.sh
}

auth() {
# auth query menu
. query/qauth.sh
}

bank() {
  # bank query menu
. query/qbank.sh
}

block() {
  # block query menu
mkdir tmp
dialog --backtitle "Block query menu" --title "Block query form" \
--form "\npopulate block query form" 15 90 7 \
"Height:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qblock.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and 
# declare variables as inputs
export HEIGHT=`sed -n 1p tmp/qblock.tmp`
export CHAIN=`sed -n 2p tmp/qblock.tmp`
docker exec -it node bandd query block $HEIGHT --chain-id $CHAIN
echo "press enter to continue"
read
# remove temporary file created
rm -f tmp/qblock.tmp
}

coinswap() {
  # coinswap query menu
. query/qcoinswap.sh
read
}

distribution() {
  # distribution query menu
. query/qdistribution.sh
}

evidence() { 
# evidence query menu
docker exec -it node bandd query evidence
echo "press enter to continue"
read
}

gov() {
  # gov query menu
. query/qgov.sh
}

ibc() {
  # ibc query menu
. query/qibc.sh
}

mint() {
  # query mint menu
. query/qmint.sh
}

oracle() {
# oracle query menu
. query/qoracle.sh
}

params() {
# query params menu
. query/qparams.sh
}

slashing() {
#slashing query menu
. query/qslashing.sh
}

staking() {
# staking query menu
. query/qstaking.sh
}

telemetry() {
# telemetry query menu
. query/qtelemetry.sh
}

tendermint() {
# tendermint-validator-set query menu
. query/qtendermint.sh
}

tx() {
# tx query menu
. query/qtx.sh
}

upgrade() {
# upgrade query menu
. query/qupgrade.sh
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
17 "Tendermint-validator-set"
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
  account
  END=$(date +%s)
  clear
;;
#############################################################

2 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  auction
  END=$(date +%s)
  clear
;;
###############################################################

3 )
  # Xiaomi Olivelite build menu
  clear
  BEGIN=$(date +%s)
  auth
  END=$(date +%s)
  clear
;;

###############################################################

4 )
  # Xiaomi Olivelite build menu
  clear
  BEGIN=$(date +%s)
  bank
  END=$(date +%s)
  clear
;;

#############################################################
5 )
  # samsung beyond0qlte build menu
  clear
  BEGIN=$(date +%s)
  block
  END=$(date +%s)
  clear
;;
#############################################################
6 )
  # samsung beyond1qlte build menu
  clear
  BEGIN=$(date +%s)
  coinswap
  END=$(date +%s)
  clear
;;
#############################################################
7 )
  # samsung beyond2qlte build menu
  clear
  BEGIN=$(date +%s)
  distribution
  END=$(date +%s)
  clear
;;
#############################################################
8 )
  # samsung d1q build menu
  clear
  BEGIN=$(date +%s)
  evidence
  END=$(date +%s)
  clear
;;
#############################################################
9 )
  # samsung d2q build menu
  clear
  BEGIN=$(date +%s)
  gov
  END=$(date +%s)
  clear
;;
#############################################################
10 )
  # Motorola edge s codename nio
  clear
  BEGIN=$(date +%s)
  ibc
  END=$(date +%s)
  clear
;;
##############################################################
11 )
  # Motorola G8 power codename sofiaR
  clear
  BEGIN=$(date +%s)
  mint
  END=$(date +%s)
  clear
;;
#############################################################
12 )
  # samsung beyond2qlte build menu
  clear
  BEGIN=$(date +%s)
  oracle
  END=$(date +%s)
  clear
;;
#############################################################
13 )
  # samsung d1q build menu
  clear
  BEGIN=$(date +%s)
  params
  END=$(date +%s)
  clear
;;
#############################################################
14 )
  # samsung d2q build menu
  clear
  BEGIN=$(date +%s)
  slashing
  END=$(date +%s)
  clear
;;
#############################################################
15 )
  # Motorola edge s codename nio
  clear
  BEGIN=$(date +%s)
  staking
  END=$(date +%s)
  clear
;;
##############################################################
16 )
  # Motorola G8 power codename sofiaR
  clear
  BEGIN=$(date +%s)
  telemetry
  END=$(date +%s)
  clear
;;
##########################################################
#############################################################
17 )
  # samsung beyond2qlte build menu
  clear
  BEGIN=$(date +%s)
  tendermint
  END=$(date +%s)
  clear
;;
#############################################################
18 )
  # samsung d1q build menu
  clear
  BEGIN=$(date +%s)
  tx
  END=$(date +%s)
  clear
;;
#############################################################
19 )
  # samsung d2q build menu
  clear
  BEGIN=$(date +%s)
  upgrade
  END=$(date +%s)
  clear
;;
#############################################################
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
  ./ragnarok.sh
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


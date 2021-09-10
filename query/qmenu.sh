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
. qaccount.sh
}

auction() {
. qauction.sh
}

auth() {
# auth query menu
. qauth.sh
}

bank() {
  # bank query menu
. qbank.sh
}

block() {
  # block query menu
. qblock.sh
}

coinswap() {
  # coinswap query menu
. qcoinswap.sh
}

distribution() {
  # distribution query menu
. qdistribution.sh
}

evidence() { 
# evidence query menu
. qevidence.sh
}

gov() {
  # gov query menu
. qgov.sh
}

ibc() {
  # ibc query menu
. qibc.sh
}

mint() {
  # query mint menu
. qmint.sh
}

oracle() {
# oracle query menu
. qoracle.sh
}

params() {
# query params menu
. qparams.sh
}

slashing() {
#slashing query menu
. qslashing.sh
}

staking() {
# staking query menu
. qstaking.sh
}

telemetry() {
# telemetry query menu
. qtelemetry.sh
}

tendermint() {
# tendermint-validator-set query menu
. qtendermint.sh
}

tx() {
# tx query menu
. qtx.sh
}

upgrade() {
# upgrade query menu
. qupgrade.sh
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


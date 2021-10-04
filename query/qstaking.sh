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
delegation() {
  # account query menu
mkdir tmp
dialog --backtitle "Query delegation menu" --title "query delegation form" \
--form "\npopulate query delegation form" 15 90 7 \
"Delegator wallet address:" 1 1 "" 1 25 70 120  \
"Validator:" 2 1 "" 2 25 70 120 \
"chain-id:" 3 1 "" 3 25 70 120 > tmp/qstaking.tmp \
2>&1 >/dev/tty
export ADDRESS=`sed -n 1p tmp/qstaking.tmp`
export VALIDATOR=`sed -n 2p tmp/qstaking.tmp`
export CHAIN=`sed -n 3p tmp/qstaking.tmp`
dialog --title "delegation query" --msgbox "$(docker exec -it node bandd query staking delegation $ADDRESS $VALIDATOR --chain-id $CHAIN --node http://34.77.171.169:26657)" 40 90
rm -f tmp/qstaking.tmp
echo "press enter to continue"
read 
}

delegations() {
mkdir tmp
dialog --backtitle "Query delegations menu" --title "query delegations form" \
--form "\npopulate query delegations form" 15 90 7 \
"Delegator wallet address:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qstaking.tmp \
2>&1 >/dev/tty
export ADDRESS=`sed -n 1p tmp/qstaking.tmp`
export CHAIN=`sed -n 2p tmp/qstaking.tmp`
dialog --title "delegations query" --msgbox "$(docker exec -it node bandd query staking delegations $ADDRESS --chain-id $CHAIN --node http://34.77.171.169:26657)" 40 90
rm -f tmp/qstaking.tmp
echo "press enter to continue"
read
}

delegations-to () {
mkdir tmp
dialog --backtitle "Query delegations-to menu" --title "query delegations-to form" \
--form "\npopulate query delegations-to form" 15 90 7 \
"Validator address:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qstaking.tmp \
2>&1 >/dev/tty
export VALIDATOR=`sed -n 1p tmp/qstaking.tmp`
export CHAIN=`sed -n 2p tmp/qstaking.tmp`
dialog --title "delegations-to query" --msgbox "$(docker exec -it node bandd query staking delegations $VALIDATOR --chain-id $CHAIN --node http://34.77.171.169:26657)" 40 90
rm -f tmp/qstaking.tmp
echo "press enter to continue"
read
}

historical-info() {
# auth query menu
mkdir tmp
dialog --backtitle "Query historical-info menu" --title "query historical-info form" \
--form "\npopulate query historical-info form" 15 90 7 \
"Height:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qstaking.tmp \
2>&1 >/dev/tty
export HEIGHT=`sed -n 1p tmp/qstaking.tmp`
export CHAIN=`sed -n 2p tmp/qstaking.tmp`
dialog --title "historical-info query" --msgbox "$(docker exec -it node bandd query staking historical-info $HEIGHT --chain-id $CHAIN --node http://34.77.171.169:26657)" 40 90
rm -f tmp/qstaking.tmp
echo "press enter to continue"
read
}

params() {
  # bank query menu
dialog --title "query staking params" --msgbox "$(docker exec -it node bandd query staking params --node http://34.77.171.169:26657)" 40 90
}

pool() {
  # coinswap query menu
dialog --title "query staking params" --msgbox "$(docker exec -it node bandd query staking pool --node http://34.77.171.169:26657)" 40 90
}

redelegation() {
  # distribution query menu
mkdir tmp
dialog --backtitle "Query redelegation menu" --title "query redelegation form" \
--form "\npopulate query redelegation form" 15 90 7 \
"Delegator wallet address:" 1 1 "" 1 25 70 120  \
"source validator:" 2 1 "" 2 25 70 120 \
"destination validator:" 3 1 "" 3 25 70 120 \
"chain-id:" 4 1 "" 4 25 70 120 > tmp/qstaking.tmp \
2>&1 >/dev/tty
export ADDRESS=`sed -n 1p tmp/qstaking.tmp`
export SRCVALIDATOR=`sed -n 2p tmp/qstaking.tmp`
export DSTVALIDATOR=`sed -n 3p tmp/qstaking.tmp`
export CHAIN=`sed -n 4p tmp/qstaking.tmp`
dialog --title "redelegation query" --msgbox "$(docker exec -it node bandd query staking redelegation $ADDRESS $SRCVALIDATOR $DSTVALIDATOR --chain-id $CHAIN --node http://34.77.171.169:26657)" 40 90
rm -f tmp/qstaking.tmp
echo "press enter to continue"
read 
}

redelegations() {
# evidence query menu
mkdir tmp
dialog --backtitle "Query redelegations menu" --title "query redelegations form" \
--form "\npopulate query redelegations form" 15 90 7 \
"Delegator wallet address:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qstaking.tmp \
2>&1 >/dev/tty
export ADDRESS=`sed -n 1p tmp/qstaking.tmp`
export CHAIN=`sed -n 2p tmp/qstaking.tmp`
dialog --title "redelegations query" --msgbox "$(docker exec -it node bandd query staking redelegations $ADDRESS --chain-id $CHAIN --node http://34.77.171.169:26657)" 40 90
rm -f tmp/qstaking.tmp
echo "press enter to continue"
read
}

redelegations-from() {
  # gov query menu
mkdir tmp
dialog --backtitle "Query redelegations-from menu" --title "query redelegations-from form" \
--form "\npopulate query redelegations-from form" 15 90 7 \
"Validator address:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qstaking.tmp \
2>&1 >/dev/tty
export VALIDATOR=`sed -n 1p tmp/qstaking.tmp`
export CHAIN=`sed -n 2p tmp/qstaking.tmp`
dialog --title "redelegations-from query" --msgbox "$(docker exec -it node bandd query staking redelegations-from $VALIDATOR --chain-id $CHAIN --node http://34.77.171.169:26657)" 40 90
rm -f tmp/qstaking.tmp
echo "press enter to continue"
read
}

unbonding-delegation() {
  # ibc query menu
mkdir tmp
dialog --backtitle "Query unbonding-delegation menu" --title "query unbonding-delegation form" \
--form "\npopulate query unbonding-delegation form" 15 90 7 \
"Delegator wallet address:" 1 1 "" 1 25 70 120  \
"Validator:" 2 1 "" 2 25 70 120 \
"chain-id:" 3 1 "" 3 25 70 120 > tmp/qstaking.tmp \
2>&1 >/dev/tty
export ADDRESS=`sed -n 1p tmp/qstaking.tmp`
export VALIDATOR=`sed -n 2p tmp/qstaking.tmp`
export CHAIN=`sed -n 3p tmp/qstaking.tmp`
dialog --title "unbonding-delegation query" --msgbox "$(docker exec -it node bandd query staking unbonding-delegation $ADDRESS $VALIDATOR --chain-id $CHAIN --node http://34.77.171.169:26657)" 40 90
rm -f tmp/qstaking.tmp
echo "press enter to continue"
read 
}

unbonding-delegations() {
# oracle query menu
mkdir tmp
dialog --backtitle "Query unbonding-delegations menu" --title "query unbonding-delegations form" \
--form "\npopulate query unbonding-delegations form" 15 90 7 \
"Delegator wallet address:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qstaking.tmp \
2>&1 >/dev/tty
export ADDRESS=`sed -n 1p tmp/qstaking.tmp`
export CHAIN=`sed -n 2p tmp/qstaking.tmp`
dialog --title "unbonding-delegations query" --msgbox "$(docker exec -it node bandd query staking unbonding-delegations $ADDRESS --chain-id $CHAIN --node http://34.77.171.169:26657)" 40 90
rm -f tmp/qstaking.tmp
echo "press enter to continue"
read
}

unbonding-delegations-from() {
# query params menu
mkdir tmp
dialog --backtitle "Query unbonding-delegations-from menu" --title "query unbonding-delegations-from form" \
--form "\npopulate query unbonding-delegations-from form" 15 90 7 \
"Validator address:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qstaking.tmp \
2>&1 >/dev/tty
export VALIDATOR=`sed -n 1p tmp/qstaking.tmp`
export CHAIN=`sed -n 2p tmp/qstaking.tmp`
dialog --title "unbonding-delegations-from query" --msgbox "$(docker exec -it node bandd query staking unbonding-delegations-from $VALIDATOR --chain-id $CHAIN --node http://34.77.171.169:26657)" 40 90
rm -f tmp/qstaking.tmp
echo "press enter to continue"
read
}

validator() {
#slashing query menu
mkdir tmp
dialog --backtitle "Query staking validator menu" --title "query staking validator form" \
--form "\npopulate query unbonding-delegations-from form" 15 90 7 \
"Validator address:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qstaking.tmp \
2>&1 >/dev/tty
export VALIDATOR=`sed -n 1p tmp/qstaking.tmp`
export CHAIN=`sed -n 2p tmp/qstaking.tmp`
dialog --title "staking validator query" --msgbox "$(docker exec -it node bandd query staking validator $VALIDATOR --chain-id $CHAIN --node http://34.77.171.169:26657)" 40 90
rm -f tmp/qstaking.tmp
echo "press enter to continue"
read
}

validators() {
# staking query menu
mkdir -p tmp
docker exec node bandd q staking validators --node http://34.77.171.169:26657 > tmp/validators.tmp
dialog --title "query staking validators" --textbox tmp/validators.tmp 12000 90
rm -f tmp/validators.tmp
}
 
#section1

###############

HEIGHT=30
WIDTH=50
CHOICE_HEIGHT=8
BACKTITLE="RAGNAROK"
TITLE="Query Oracle Menu"
MENU="Choose one of the following options:"

OPTIONS=(
1 "delegation"
2 "delegations"
3 "delegations-to"
4 "historical-info"
5 "params"
6 "pool "
7 "redelegation"
8 "redelegations"
9 "redelegations-from"
10 "unbonding-delegation"
11 "unbonding-delegations"
12 "unbonding-delegations-from"
13 "validator"
14 "validators"
#section2
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
  delegation
  END=$(date +%s)
  clear
;;
#############################################################

2 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  delegations
  END=$(date +%s)
  clear
;;
###############################################################

3 )
  # Xiaomi Olivelite build menu
  clear
  BEGIN=$(date +%s)
  delegations-to
  END=$(date +%s)
  clear
;;

###############################################################

4 )
  # Xiaomi Olivelite build menu
  clear
  BEGIN=$(date +%s)
  historical-info
  END=$(date +%s)
  clear
;;

#############################################################
5 )
  # samsung beyond0qlte build menu
  clear
  BEGIN=$(date +%s)
  params
  END=$(date +%s)
  clear
;;
#############################################################
6 )
  # samsung beyond1qlte build menu
  clear
  BEGIN=$(date +%s)
  pool
  END=$(date +%s)
  clear
;;
#############################################################
7 )
  # samsung beyond2qlte build menu
  clear
  BEGIN=$(date +%s)
  redelegation
  END=$(date +%s)
  clear
;;
#############################################################
8 )
  # samsung d1q build menu
  clear
  BEGIN=$(date +%s)
  redelegations
  END=$(date +%s)
  clear
;;
#############################################################
9 )
  # samsung d2q build menu
  clear
  BEGIN=$(date +%s)
  redelegations-from
  END=$(date +%s)
  clear
;;
#############################################################
10 )
  # Motorola edge s codename nio
  clear
  BEGIN=$(date +%s)
  unbonding-delegation
  END=$(date +%s)
  clear
;;
##############################################################
11 )
  # Motorola G8 power codename sofiaR
  clear
  BEGIN=$(date +%s)
  unbonding-delegations
  END=$(date +%s)
  clear
;;
#############################################################
12 )
  # samsung beyond2qlte build menu
  clear
  BEGIN=$(date +%s)
  unbonding-delegations-from
  END=$(date +%s)
  clear
;;
#############################################################
13 )
  # samsung d1q build menu
  clear
  BEGIN=$(date +%s)
  validator
  END=$(date +%s)
  clear
;;
#############################################################
14 )
  # samsung d2q build menu
  clear
  BEGIN=$(date +%s)
  validators
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

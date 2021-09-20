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
active-validators() {
  # account query menu
dialog --title "query active oracle validators" --msgbox "$(docker exec -it node bandd query oracle active-validators)" 40 90
}

counts() {
dialog --title "query active oracle validators" --msgbox "$(docker exec -it node bandd query oracle counts)" 40 90
}

data() {
read
}

data-provider-reward() {
# auth query menu
dialog --title "query active oracle validators" --msgbox "$(docker exec -it node bandd query oracle data-provider-reward)" 40 90
}

data-providers-pool() {
  # bank query menu
dialog --title "query active oracle validators" --msgbox "$(docker exec -it node bandd query oracle data-providers-pool)" 40 90
}

data-source() {
  # coinswap query menu
read
}

data-sources() {
  # distribution query menu
read
}

oracle-script() {
# evidence query menu
docker exec -it node bandd query evidence
echo "press enter to continue"
read
}

oracle-scripts() {
  # gov query menu
. query/qgov.sh
}

params() {
  # ibc query menu
dialog --title "query active oracle validators" --msgbox "$(docker exec -it node bandd query oracle params)" 40 90 
}

reporters() {
  # query mint menu
. query/qmint.sh
}

request() {
# oracle query menu
. query/qoracle.sh
}

request-price() {
# query params menu
. query/qparams.sh
}

request-reports() {
#slashing query menu
. query/qslashing.sh
}

request-search() {
# staking query menu
. query/qstaking.sh
}

requests() {
# telemetry query menu
. query/qtelemetry.sh
}

validator() {
# tendermint-validator-set query menu
mkdir tmp
dialog --backtitle "ORACLE menu" --title "oracle validator form" \
--form "\npopulate oracle form" 15 90 7 \
"Validator addeess:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qoracle.tmp \
2>&1 >/dev/tty
export VALIDATOR=`sed -n 1p tmp/qoracle.tmp`
export CHAIN=`sed -n 2p tmp/qoracle.tmp`
dialog --title "oracle validator query" --msgbox "$(docker exec -it node bandd query account  $ADDRESS --chain-id $CHAIN)" 40 90
rm -f tmp/qoracle.tmp
echo "press enter to continue"
read
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
1 "active-validators"
2 "counts"
3 "data"
4 "data-provider-reward"
5 "data-providers-pool"
6 "data-source"
7 "data-sources"
8 "oracle-script"
9 "oracle-scripts"
10 "params"
11 "reporters"
12 "request"
13 "request-price"
14 "request-reports"
15 "request-search"
16 "requests"
17 "validator"
#section2
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
  active-validators
  END=$(date +%s)
  clear
;;
#############################################################

2 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  counts
  END=$(date +%s)
  clear
;;
###############################################################

3 )
  # Xiaomi Olivelite build menu
  clear
  BEGIN=$(date +%s)
  data
  END=$(date +%s)
  clear
;;

###############################################################

4 )
  # Xiaomi Olivelite build menu
  clear
  BEGIN=$(date +%s)
  data-provider-reward
  END=$(date +%s)
  clear
;;

#############################################################
5 )
  # samsung beyond0qlte build menu
  clear
  BEGIN=$(date +%s)
  data-providers-pool
  END=$(date +%s)
  clear
;;
#############################################################
6 )
  # samsung beyond1qlte build menu
  clear
  BEGIN=$(date +%s)
  data-source
  END=$(date +%s)
  clear
;;
#############################################################
7 )
  # samsung beyond2qlte build menu
  clear
  BEGIN=$(date +%s)
  data-sources
  END=$(date +%s)
  clear
;;
#############################################################
8 )
  # samsung d1q build menu
  clear
  BEGIN=$(date +%s)
  oracle-script
  END=$(date +%s)
  clear
;;
#############################################################
9 )
  # samsung d2q build menu
  clear
  BEGIN=$(date +%s)
  oracle-scripts
  END=$(date +%s)
  clear
;;
#############################################################
10 )
  # Motorola edge s codename nio
  clear
  BEGIN=$(date +%s)
  params
  END=$(date +%s)
  clear
;;
##############################################################
11 )
  # Motorola G8 power codename sofiaR
  clear
  BEGIN=$(date +%s)
  reporters
  END=$(date +%s)
  clear
;;
#############################################################
12 )
  # samsung beyond2qlte build menu
  clear
  BEGIN=$(date +%s)
  request
  END=$(date +%s)
  clear
;;
#############################################################
13 )
  # samsung d1q build menu
  clear
  BEGIN=$(date +%s)
  request-price
  END=$(date +%s)
  clear
;;
#############################################################
14 )
  # samsung d2q build menu
  clear
  BEGIN=$(date +%s)
  request-reports
  END=$(date +%s)
  clear
;;
#############################################################
15 )
  # Motorola edge s codename nio
  clear
  BEGIN=$(date +%s)
  request-search
  END=$(date +%s)
  clear
;;
##############################################################
16 )
  # Motorola G8 power codename sofiaR
  clear
  BEGIN=$(date +%s)
  requests
  END=$(date +%s)
  clear
;;
##########################################################
17 )
  # samsung beyond2qlte build menu
  clear
  BEGIN=$(date +%s)
  validator
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

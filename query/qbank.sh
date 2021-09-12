#!/bin/bash
# Copyright (C) 2021 iprouteth0 software
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0

CHAIN=odin-testnet-baldur

#functions
balances() {
  # account query menu
mkdir tmp
dialog --backtitle "Bank query menu" --title "Bank query form" \
--form "\npopulate bank query form" 15 90 7 \
"Wallet addeess:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qbank.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export ADDRESS=`sed -n 1p tmp/qbank.tmp`
export CHAIN=`sed -n 2p tmp/qbank.tmp`

docker exec -it node bandd query bank balances $ADDRESS --chain-id $CHAIN
echo "press enter to continue"
read
# remove temporary file created
rm -f tmp/qbank.tmp
}

denom-metadata() {
docker exec -it node bandd query bank denom-metadata --chain-id $CHAIN
echo "press enter to continue"
read
}

total() {
docker exec -it node bandd query bank total --chain-id $CHAIN
echo "press enter to continue"
read
}

#section1

###############

HEIGHT=30
WIDTH=50
CHOICE_HEIGHT=8
BACKTITLE="RAGNAROK"
TITLE="Query Menu"
MENU="Choose one of the following options:"

OPTIONS=(
1 "Query bank balances"
2 "Query bank denom-metadata"
3 "Query bank total"
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
  balances
  END=$(date +%s)
  clear
;;
#############################################################

2 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  denom-metadata
  END=$(date +%s)
  clear
;;
###############################################################

3 )
  # query bank total
  clear
  BEGIN=$(date +%s)
  total
  END=$(date +%s)
  clear
;;
###############################################################
# section4
#############################################################
0 ) 
  # Return To Main Menu
  ./qmenu.sh
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


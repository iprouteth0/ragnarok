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
hash() {
  # account query menu
mkdir tmp
dialog --backtitle "TX query menu" --title "tx query form" \
--form "\npopulate tx query form" 15 90 7 \
"TX hash:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qtx.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export TXHASH=`sed -n 1p tmp/qtx.tmp`
export CHAIN=`sed -n 2p tmp/qtx.tmp`

docker exec -it node bandd query tx $TXHASH --chain-id $CHAIN
echo "press enter to continue"
read
# remove temporary file created
rm -f tmp/qtx.tmp
}

acc_seq() {
mkdir tmp
dialog --backtitle "TX query menu" --title "tx query form" \
--form "\npopulate tx query form" 15 90 7 \
"TX acc_seq:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qtx.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export TXACCSEQ=`sed -n 1p tmp/qtx.tmp`
export CHAIN=`sed -n 2p tmp/qtx.tmp`

docker exec -it node bandd query tx $TXACCSEQ --chain-id $CHAIN
echo "press enter to continue"
read
# remove temporary file created
rm -f tmp/qtx.tmp
}

signature() {
mkdir tmp
dialog --backtitle "TX query menu" --title "tx query form" \
--form "\npopulate tx query form" 15 90 7 \
"TX signature:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qtx.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export TXSIGNATURE=`sed -n 1p tmp/qtx.tmp`
export CHAIN=`sed -n 2p tmp/qtx.tmp`

docker exec -it node bandd query tx $TXSIGNATURE --chain-id $CHAIN
echo "press enter to continue"
read
# remove temporary file created
rm -f tmp/qtx.tmp
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
1 "Query TX by hash"
2 "Query TX by acc_seq"
3 "Query TX by signature"
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
  hash
  END=$(date +%s)
  clear
;;
#############################################################

2 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  acc_seq
  END=$(date +%s)
  clear
;;
###############################################################

3 )
  # query bank total
  clear
  BEGIN=$(date +%s)
  signature
  END=$(date +%s)
  clear
;;
###############################################################
# section4
#############################################################
0 ) 
  # Return To Main Menu
  ./query/qmenu.sh
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

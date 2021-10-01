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
params() {
  # account query menu
dialog --title "query slashing params" --msgbox "$(docker exec -it node bandd q slashing params --chain-id $CHAIN --node http://34.77.171.169:26657)"
read
}

signing-info() {
mkdir tmp
dialog --backtitle "slashing query menu" --title "slashing query form" \
--form "\npopulate slashing query form" 15 90 7 \
"valconspub address:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qslashing.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export VALCONSPUB=`sed -n 1p tmp/qslashing.tmp`
export CHAIN=`sed -n 2p tmp/qslashing.tmp`

dialog --title "slashing signing-info" --msgbox "$(docker exec -it node bandd query slashing signing-info $VALCONSPUB --chain-id $CHAIN --node http://34.77.171.169:26657)"
# remove temporary file created
rm -f tmp/qslashing.tmp
read
}

signing-infos() {
mkdir tmp
dialog --backtitle "slashing query menu" --title "slashing query form" \
--form "\npopulate slashing query form" 15 90 7 \
"valconspub address:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qslashing.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export VALCONSPUB=`sed -n 1p tmp/qslashing.tmp`
export CHAIN=`sed -n 2p tmp/qslashing.tmp`

dialog --title "slashing signing-info" --msgbox "$(docker exec -it node bandd query slashing signing-infos $VALCONSPUB --chain-id $CHAIN --node http://34.77.171.169:26657)"
# remove temporary file created
rm -f tmp/qslashing.tmp
read
}

generate() {
#generate your valconspub address
export VALCONSPUB=$(docker exec -it node bandd tendermint show-validator)
echo $VALCONSPUB
echo ""
echo "Press enter to continue"
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
1 "Query slashing params"
2 "Query slashing signing info"
3 "Query slashing signing infos (multiple)"
4 "Generate ODIN valconspub"
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
  params
  END=$(date +%s)
  clear
;;
#############################################################

2 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  signing-info
  END=$(date +%s)
  clear
;;
###############################################################

3 )
  # query bank total
  clear
  BEGIN=$(date +%s)
  signing-infos
  END=$(date +%s)
  clear
;;

###############################################################

4 )
  # query bank total
  clear
  BEGIN=$(date +%s)
  generate
  END=$(date +%s)
  clear
;;
###############################################################
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

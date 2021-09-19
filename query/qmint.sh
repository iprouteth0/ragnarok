#!/bin/bash
# Copyright (C) 2021 iprouteth0 software
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0

export CHAIN=odin-testnet-baldur

#functions
annual-provisions() {
dialog --title "minting annaual-provisions" --msgbox "$(docker exec -it node bandd query mint annual-provisions  --chain-id $CHAIN)" 40 90
}

eth-integration-address() {
dialog --title "mint eth-integration-address" --msgbox "$(docker exec -it node bandd query mint eth-integration-address  --chain-id $CHAIN)" 40 90
}

inflation() {
dialog --title "minting inflation" --msgbox "$(docker exec -it node bandd query mint inflation --chain-id $CHAIN)" 40 90
}

params() {
dialog --title "minting params" --msgbox "$(docker exec -it node bandd query mint params --chain-id $CHAIN)" 40 90
}

treasury-pool() {
dialog --title "minting treasury-pool" --msgbox "$(docker exec -it node bandd query mint trrasury-pool --chain-id $CHAIN)" 40 90
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
1 "Query minting annual-provisions"
2 "Query minting eth-integration-address"
3 "Query minting inflation"
4 "query minting params"
5 "query minting treasury-pool"
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
  annual-provisions
  END=$(date +%s)
  clear
;;
#############################################################

2 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  eth-integration-address
  END=$(date +%s)
  clear
;;
###############################################################

3 )
  # query bank total
  clear
  BEGIN=$(date +%s)
  inflation
  END=$(date +%s)
  clear
;;
###############################################################

4 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  params
  END=$(date +%s)
  clear
;;
###############################################################

5 )
  # query bank total
  clear
  BEGIN=$(date +%s)
  treasury-pool
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


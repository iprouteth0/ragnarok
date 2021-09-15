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
channel() {
  # account query menu
dialog --title "query ibc" --msgbox "$(docker exec -it node bandd query ibc channel channels --chain-id $CHAIN)" 40 90
echo "press enter to continue"
read
}

client-header() {
dialog --title "query ibc" --msgbox "$(docker exec -it node bandd query ibc client header --chain-id $CHAIN)" 40 90
echo "press enter to continue"
read
}

client-node-state() {
dialog --title "query ibc" --msgbox "$(docker exec -it node bandd query ibc client node-state --chain-id $CHAIN)" 40 90
echo "press enter to continue"
read
}

client-params() {
dialog --title "query ibc" --msgbox "$(docker exec -it node bandd query ibc client params --chain-id $CHAIN)" 40 90
echo "press enter to continue"
read
}

connection() {
dialog --title "query ibc" --msgbox "$(docker exec -it node bandd query ibc connection connections --chain-id $CHAIN)" 40 90
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
1 "Query ibc channel channels"
2 "Query ibc client header"
3 "query ibc client node-state"
4 "query ibc client params"
5 "Query ibc connection connections"
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
  channel
  END=$(date +%s)
  clear
;;
#############################################################

2 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  client-header
  END=$(date +%s)
  clear
;;
###############################################################

3 )
  # query bank total
  clear
  BEGIN=$(date +%s)
  client-node-state
  END=$(date +%s)
  clear
;;
###############################################################
#############################################################

4 )
  # query bank total
  clear
  BEGIN=$(date +%s)
  client-params
  END=$(date +%s)
  clear
;;
###############################################################
#############################################################

5 )
  # query bank total
  clear
  BEGIN=$(date +%s)
  connection
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


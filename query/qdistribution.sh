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
commission() {
  # account query menu
mkdir tmp
dialog --backtitle "Distribution query menu" --title "Distribution query form" \
--form "\npopulate distribution query form" 15 90 7 \
"Validator:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qdistribution.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export VALIDATOR=`sed -n 1p tmp/qdistribution.tmp`
export CHAIN=`sed -n 2p tmp/qdistribution.tmp`

docker exec -it node bandd query distribution commission $VALIDATOR --chain-id $CHAIN
echo "press enter to continue"
read
# remove temporary file created
rm -f tmp/qdistribution.tmp
}

community-pool() {
docker exec -it node bandd query distribution community-pool  --chain-id $CHAIN
echo "press enter to continue"
read
}

params() {
docker exec -it node bandd query distribution params --chain-id $CHAIN
echo "press enter to continue"
read
}

rewards() {
mkdir tmp
dialog --backtitle "Distribution query menu" --title "Distribution query form" \
--form "\npopulate distribution query form" 15 90 7 \
"Wallet:" 1 1 "" 1 25 70 120  \
"Validator" 2 1 "" 2 25 70 120 \
"chain-id:" 3 1 "" 3 25 70 120 > tmp/qdistribution.tmp \
2>&1 >/dev/tty
# Start retrieving each line from temp file 1 by one with sed and declare variables as >
export ADDRESS=`sed -n 1p tmp/qdistribution.tmp`
export VALIDATOR=`sed -n 2p tmp/qdistribution.tmp`
export CHAIN=`sed -n 3p tmp/qdistribution.tmp`
docker exec -it node bandd query distribution rewards $ADDRESS $VALIDATOR --chain-id $CHAIN
echo "press enter to continue"
read
# remove temporary file created
rm -f tmp/qdistribution.tmp
}

slashes() {
mkdir tmp
dialog --backtitle "Distribution query menu" --title "Distribution query form" \
--form "\npopulate distribution query form" 15 90 7 \
"Validator:" 1 1 "" 1 25 70 120  \
"Start height" 2 1 "" 2 25 70 120 \
"End height:" 3 1 "" 3 25 70 120 \
"chain-id:" 4 1 "" 4 25 70 120 > tmp/qdistribution.tmp \
2>&1 >/dev/tty
# Start retrieving each line from temp file 1 by one with sed and declare variables as >
export VALIDATOR=`sed -n 1p tmp/qdistribution.tmp`
export STARTHEIGHT=`sed -n 2p tmp/qdistribution.tmp`
export ENDHEIGHT=`sed -n 3p tmp/qdistribution.tmp`
export CHAIN=`sed -n 4p tmp/qdistribution.tmp`
docker exec -it node bandd query distribution slashes $VALIDATOR $STARTHEIGHT $ENDHEIGHT
echo "press enter to continue"
read
}

validator-outstanding-rewards() {
mkdir tmp
dialog --backtitle "Distribution query menu" --title "Distribution query form" \
--form "\npopulate distribution query form" 15 90 7 \
"Validator:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qdistribution.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as >
export VALIDATOR=`sed -n 1p tmp/qdistribution.tmp`
export CHAIN=`sed -n 2p tmp/qdistribution.tmp`

docker exec -it node bandd query distribution validator-outstanding-rewards $VALIDATOR --chain-id $CHAIN
echo "press enter to continue"
read
# remove temporary file created
rm -f tmp/qdistribution.tmp
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
1 "Query distribution commission"
2 "Query distribution community-pool"
3 "Query distribution params"
4 "query distribution rewards"
5 "query diatribution slashing"
6 "query distribution validator-outstanding-rewards"
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
  commission
  END=$(date +%s)
  clear
;;
#############################################################

2 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  community-pool
  END=$(date +%s)
  clear
;;
###############################################################

3 )
  # query bank total
  clear
  BEGIN=$(date +%s)
  params
  END=$(date +%s)
  clear
;;
###############################################################

4 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  rewards
  END=$(date +%s)
  clear
;;
###############################################################

5 )
  # query bank total
  clear
  BEGIN=$(date +%s)
  slashes
  END=$(date +%s)
  clear
;;
###############################################################
#############################################################

6 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  validator-outstanding-rewards
  END=$(date +%s)
  clear
;;
#############################################################
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


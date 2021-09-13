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
deposit() {
  # account query menu
mkdir tmp
dialog --backtitle "gov deposit query menu" --title "gov deposit query form" \
--form "\npopulate gov deposit query form" 15 90 7 \
"proposal-id:" 1 1 "" 1 25 70 120  \
"depositer address:" 2 1 "" 2 25 70 120 \
"chain-id:" 3 1 "" 3 25 70 120 > tmp/qgov.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export PROPOSAL=`sed -n 1p tmp/qgov.tmp`
export DEPOSITER=`sed -n 2p tmp/qgov.tmp`
export CHAIN=`sed -n 3p tmp/qgov.tmp`

docker exec -it node bandd query gov deposit $PROPOSAL $DEPOSITER --chain-id $CHAIN
echo "press enter to continue"
read
# remove temporary file created
rm -f tmp/qgov.tmp
}

deposits() {
mkdir tmp
dialog --backtitle "gov deposits query menu" --title "gov deposits query form" \
--form "\npopulate gov deposits query form" 15 90 7 \
"proposal-id:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qgov.tmp \
2>&1 >/dev/tty
export PROPOSAL=`sed -n 1p tmp/qgov.tmp`
export CHAIN=`sed -n 2p tmp/qgov.tmp`
docker exec -it node bandd query gov deposits $PROPOSAL --chain-id $CHAIN
echo "press enter to continue"
read
}

params() {
docker exec -it node bandd query gov params --chain-id $CHAIN
echo "press enter to continue"
read
}

proposal() {
mkdir tmp
dialog --backtitle "Proposal query menu" --title "Proposal query form" \
--form "\npopulate proposal query form" 15 90 7 \
"Proposal-id:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qgov.tmp \
2>&1 >/dev/tty
# Start retrieving each line from temp file 1 by one with sed and declare variables as >
export PROPOSAL=`sed -n 1p tmp/qgov.tmp`
export CHAIN=`sed -n 2p tmp/qgov.tmp`
docker exec -it node bandd query gov proposal $PROPOSAL --chain-id $CHAIN
echo "press enter to continue"
read
# remove temporary file created
rm -f tmp/qdistribution.tmp
}

proposals() {
docker exec -it node bandd query gov proposals
echo "press enter to continue"
read
}

proposer() {
mkdir tmp
dialog --backtitle "Proposer query menu" --title "Proposer query form" \
--form "\npopulate proposer query form" 15 90 7 \
"Proposal-id:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qgov.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as >
export PROPOSER=`sed -n 1p tmp/qgov.tmp`
export CHAIN=`sed -n 2p tmp/qgov.tmp`

docker exec -it node bandd query gov proposer $PROPOSAL --chain-id $CHAIN
echo "press enter to continue"
read
# remove temporary file created
rm -f tmp/qgov.tmp
}

tally() {
echo toast
}

vote() {
echo toast
}

votes() {
echo toast
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
1 "Query gov deposit"
2 "Query gov deposits"
3 "Query gov params"
4 "query gov proposal"
5 "query gov proposals"
6 "query gov proposer"
7 "query gov tally"
8 "query gov vote"
9 "queey gov votes"
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
  deposit
  END=$(date +%s)
  clear
;;
#############################################################

2 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  deposits
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
  proposal
  END=$(date +%s)
  clear
;;
###############################################################

5 )
  # query bank total
  clear
  BEGIN=$(date +%s)
  proposals
  END=$(date +%s)
  clear
;;
###############################################################
#############################################################

6 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  proposer
  END=$(date +%s)
  clear
;;
###############################################################
###############################################################
7 )
  # query bank total
  clear
  BEGIN=$(date +%s)
  tally
  END=$(date +%s)
  clear
;;
###############################################################
###############################################################
8 )
  # query bank total.
  clear
  BEGIN=$(date +%s)
  vote
  END=$(date +%s)
  clear
;;
###############################################################
###############################################################
9 )
  # query bank total
  clear
  BEGIN=$(date +%s)
  votes
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


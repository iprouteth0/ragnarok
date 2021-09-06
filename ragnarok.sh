#!/bin/bash
#
# Copyright (C) 2016 BeansTown106 for PureNexus Project
# Copyright (C) 2021 A-Team Digital Solutions
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#


# Colors
black=`tput setaf 0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 7`
reset=`tput sgr0`

#functions
status() {
  # ginna Build menu
dialog --title "Hello" --msgbox "$(docker exec -it node bandd status)" 60 80

}

delegate() {
  # Olivewood Build menu
  export DEVICEDIR="device/xiaomi/olivewood"
  export DEVICENAME=olivewood
  export SOURCESCRIPT=olivewood
  . Build_script.sh 
}

undelegate() {
  # xiaomi olivelite Build menu
  export DEVICEDIR="device/xiaomi/olivelite"
  export DEVICENAME=olivelite
  export SOURCESCRIPT=olivelite
  . Build_script.sh 
}

balance() {
  # xiaomi olives cafebabe trees
  export DEVICEDIR="device/xiaomi/olives"
  export DEVICENAME=olives
  export SOURCESCRIPT=cafebabe
  . Build_script.sh 
}

send() {
  # samsung beyond0qlte Build menu
  export DEVICEDIR="device/samsung/beyond0qlte"
  export DEVICENAME=beyond0qlte
  export SOURCESCRIPT=sm8150
  . Build_script.sh 
}

query() {
  # samsung beyond1qlte Build menu
  export DEVICEDIR="device/samsung/beyond1qlte"
  export DEVICENAME=beyond1qlte
  export SOURCESCRIPT=sm8150
  . Build_script.sh 
}

vote() {
  # samsung beyond2qlte Build menu
  export DEVICEDIR="device/samsung/beyond2qlte"
  export DEVICENAME=beyond2qlte
  export SOURCESCRIPT=sm8150
  . Build_script.sh 
}

unjail() {
  # samsung d1q Build menu
  export DEVICEDIR="device/samsung/d1q"
  export DEVICENAME=d1q
  export SOURCESCRIPT=sm8150
  . Build_script.sh 
}

yoda() {
  # samsung d2q Build menu
  export DEVICEDIR="device/samsung/d2q"
  export DEVICENAME=d2q
  export SOURCESCRIPT=sm8150
  . Build_script.sh 
}

keys() {
  # Motorola edge s codename nio
  export DEVICEDIR="device/motorola/nio"
  export DEVICENAME=nio
  export SOURCESCRIPT=nio
  . Build_script.sh 
}

tx() {
  # Motorola G8 power codename sofiaR
  export DEVICEDIR="device/motorola/sofiar"
  export DEVICENAME=sofiar
  export SOURCESCRIPT=sofiar
  . Build_script.sh 
}


#section1

generatescript() {
#
. Generate_codename_clone_sources.sh
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
TITLE="Node Menu"
MENU="Choose one of the following options:"

OPTIONS=(
1 "Status"                                             
2 "Balances"
3 "Delegate" 
4 "Undelegate"
5 "TX"
6 "Send"
7 "Query"
8 "Vote"
9 "Unjail"
10 "Keys"
11 "Yoda"
#section2
98 "generate device sources script"
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
  status
  END=$(date +%s)
  clear
;;
#############################################################

2 )
  # Xiaomi Olivewood build menu
  clear
  BEGIN=$(date +%s)
  olivewood
  END=$(date +%s)
  clear
;;
###############################################################

3 )
  # Xiaomi Olivelite build menu
  clear
  BEGIN=$(date +%s)
  olivelite
  END=$(date +%s)
  clear
;;

###############################################################

4 )
  # Xiaomi Olivelite build menu
  clear
  BEGIN=$(date +%s)
  cafebabe
  END=$(date +%s)
  clear
;;

#############################################################
5 )
  # samsung beyond0qlte build menu
  clear
  BEGIN=$(date +%s)
  beyond0qlte
  END=$(date +%s)
  clear
;;
#############################################################
6 )
  # samsung beyond1qlte build menu
  clear
  BEGIN=$(date +%s)
  beyond1qlte
  END=$(date +%s)
  clear
;;
#############################################################
7 )
  # samsung beyond2qlte build menu
  clear
  BEGIN=$(date +%s)
  beyond2qlte
  END=$(date +%s)
  clear
;;
#############################################################
8 )
  # samsung d1q build menu
  clear
  BEGIN=$(date +%s)
  d1q
  END=$(date +%s)
  clear
;;
#############################################################
9 )
  # samsung d2q build menu
  clear
  BEGIN=$(date +%s)
  d2q
  END=$(date +%s)
  clear
;;
#############################################################
10 )
  # Motorola edge s codename nio
  clear
  BEGIN=$(date +%s)
  nio
  END=$(date +%s)
  clear
;;
##############################################################
11 )
  # Motorola G8 power codename sofiaR
  clear
  BEGIN=$(date +%s)
  sofiar
  END=$(date +%s)
  clear
;;
##########################################################
# section4
#############################################################
98 )
  # generate device sources script
  clear
  BEGIN=$(date +%s)
  generatescript
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
done
###########################################################


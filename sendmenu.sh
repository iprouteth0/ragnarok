#!/bin/bash

mkdir tmp
dialog --backtitle "Sending menu" --title "sending form" \
--form "\npopulate send form" 15 90 7 \
"From wallet addeess:" 1 1 "" 1 25 70 120  \
"To wallet:" 2 1 "" 2 25 70 120 \
"Amount(loki):" 3 1 "" 3 25 70 120 \
"Memo:" 4 1 "" 4 25 70 120 \
"chain-id:" 5 1 "" 5 25 70 120 > tmp/sendmenu.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export FROMADDRESS=`sed -n 1p tmp/sendmenu.tmp`
export TOADDRESS=`sed -n 2p tmp/sendmenu.tmp`
export AMOUNT=`sed -n 3p tmp/sendmenu.tmp`
export MEMO=`sed -n 4p tmp/sendmenu.tmp`
export CHAIN=`sed -n 5p tmp/sendmenu.tmp`

docker exec -it node bandd tx bank send $FROMADDRESS $TOADDRESS $AMOUNT --memo $MEMO --gas auto --chain-id $CHAIN --node http://34.77.171.169:26657
echo "press enter to continue"
read

# remove temporary file created
rm -f tmp/sendmenu.tmp

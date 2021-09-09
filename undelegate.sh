#!/bin/bash

mkdir tmp
dialog --backtitle "Undelegate menu" --title "Undelegate from validator form" \
--form "\npopulate undelegate form" 15 90 7 \
"Wallet addeess:" 1 1 "" 1 25 70 120  \
"validator:" 2 1 "" 2 25 70 120  \
"amount:" 3 1 "" 3 25 70 120 \
"chain-id:" 4 1 "" 4 25 70 120 > tmp/undelegate.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export ADDRESS=`sed -n 1p tmp/undelegate.tmp`
export VALIDATOR=`sed -n 2p tmp/undelegate.tmp`
export AMOUNT=`sed -n 3p tmp/undelegate.tmp`
export CHAIN=`sed -n 4p tmp/undelegate.tmp`

docker exec -it node bandd tx staking unbond $VALIDATOR $AMOUNT --from $ADDRESS --chain-id $CHAIN --gas auto
echo "press enter to continue"
read
# remove temporary file created
rm -f tmp/undelegate.tmp

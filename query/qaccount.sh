#!/bin/bash

mkdir tmp
dialog --backtitle "Delegate menu" --title "Delegate to validator form" \
--form "\npopulate delegate form" 15 90 7 \
"Wallet addeess:" 1 1 "" 1 25 70 120  \
"chain-id:" 2 1 "" 2 25 70 120 > tmp/qaccount.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export ADDRESS=`sed -n 1p tmp/qaccount.tmp`
export CHAIN=`sed -n 2p tmp/qaccount.tmp`

docker exec -it node bandd query account  $ADDRESS --chain-id $CHAIN
echo "press enter to continue"
read

# remove temporary file created
rm -f tmp/qaccount.tmp

#!/bin/bash

mkdir tmp
dialog --backtitle "Unjail menu" --title "Unjail validator form" \
--form "\nunjail validator form" 15 90 7 \
"Wallet addeess:" 1 1 "" 1 25 70 120  \
"validator:" 2 1 "" 2 25 70 120  \
"chain-id:" 3 1 "" 3 25 70 120 > tmp/unjail.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export ADDRESS=`sed -n 1p tmp/unjail.tmp`
export VALIDATOR=`sed -n 2p tmp/unjail.tmp`
export CHAIN=`sed -n 3p tmp/unjail.tmp`

odind tx slashing unjail $VALIDATOR --from $ADDRESS --chain-id $CHAIN --gas auto
echo "press enter to continue"
read
# remove temporary file created
rm -f tmp/unjail.tmp

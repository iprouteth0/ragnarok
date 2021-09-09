#!/bin/bash

mkdir tmp
dialog --backtitle "node details menu" --title "Node details form" \
--form "\npopulate node detail variables" 15 90 7 \
"Wallet addeess:" 1 1 "" 1 25 70 120  \
"moniker:" 2 1 "" 2 25 70 120  \
"chain:" 3 1 "" 3 25 70 120 > tmp/out.tmp \
2>&1 >/dev/tty

# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export ADDRESS=`sed -n 1p tmp/out.tmp`
export MONIKER=`sed -n 2p tmp/out.tmp`
export CHAIN=`sed -n 3p tmp/out.tmp`

# remove temporary file created
rm -f tmp/out.tmp

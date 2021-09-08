#!/bin/bash

mkdir delegate
dialog --backtitle "Delegate menu" --title "Delegate to validator form" \
--form "\npopulate delegate form" 15 90 7 \
"Wallet addeess:" 1 1 "" 1 25 70 120  \
"validator:" 2 1 "" 2 25 70 120  \
"amount:" 3 1 "" 3 25 70 120 \
"chain-id:" 4 1 "" 4 25 70 120 > delegate/out.tmp \
2>&1 >/dev/tty
# Start retrieving each line from temp file 1 by one with sed and declare variables as inputs
export ADDRESS=`sed -n 1p delegate/out.tmp`
export VALIDATOR=`sed -n 2p delegate/out.tmp`
export AMOUNT=`sed -n 3p delegate/out.tmp`
export CHAIN=`sed -n 4p delegate/out.tmp`
docker exec -it node bandd tx staking delegate $VALIDATOR $AMOUNT --from $ADDRESS --chain-id $CHAIN --gas auto
# remove temporary file created
rm -f delegate/out.tmp
#Write to output file the result
#echo $CODENAME , $MENUNUMBER , $TREEDIR , >> testfile

#mkdir tmp/
#cp addsection* tmp
#sed -i "s|CODENAME|$CODENAME|" tmp/addsection1.txt
#sed -i "s|CODENAME|$CODENAME|" tmp/addsection2.txt
#sed -i "s|CODENAME|$CODENAME|" tmp/addsection4.txt

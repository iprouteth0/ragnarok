#!/bin/bash


dialog --title "Query tendermint-validator-set" --msgbox "$(docker exec -it node bandd query tendermint-validator-set --chain-id $CHAIN)"

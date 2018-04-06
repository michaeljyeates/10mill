#!/bin/bash

CLEOS=/data/bin/master/cleos/cleos
HOST=localhost
PORT=8822
WALLET_HOST=localhost
WALLET_PORT=3456
EOS_BUILD_DIR=/data/src/master/build
EOSIO_KEY=EOS7rgcwNPrpgd9FSGAyg6Qn5pHE3sV1nYhiXDRDB2rtVkoh7BX7H


$CLEOS -H $HOST -p $PORT --wallet-host $WALLET_HOST --wallet-port $WALLET_PORT set contract eosio $EOS_BUILD_DIR/contracts/eosio.bios/ -p eosio


PRODUCERS_JSON='{"version":1,"producers":['
while read -r line
do
    	a=(${line//,/ })
    	name="${a[0]}"
    	key="${a[1]}"

        $CLEOS -H $HOST -p $PORT --wallet-host $WALLET_HOST --wallet-port $WALLET_PORT create account eosio $name $key $key
        PRODUCERS_JSON="$PRODUCERS_JSON{\"producer_name\":\"$name\",\"block_signing_key\":\"$key\"}"

done < "producers.csv"



PRODUCERS_JSON="$PRODUCERS_JSON,{\"producer_name\":\"eosio\",\"block_signing_key\":\"$EOSIO_KEY\"}]}"

echo $PRODUCERS_JSON

$CLEOS -H $HOST -p $PORT --wallet-host $WALLET_HOST --wallet-port $WALLET_PORT push action eosio setprods "$PRODUCERS_JSON" -p eosio



$CLEOS -H $HOST -p $PORT --wallet-host $WALLET_HOST --wallet-port $WALLET_PORT set contract eosio $EOS_BUILD_DIR/contracts/eosio.system/ -p eosio


$CLEOS -H $HOST -p $PORT --wallet-host $WALLET_HOST --wallet-port $WALLET_PORT push action eosio issue '{"to":"eosio", "quantity":"1000000000.0000 EOS"}' -p eosio@active

while read -r line
do
    	a=(${line//,/ })
    	name="${a[0]}"
    	key="${a[1]}"

	$CLEOS -H $HOST -p $PORT --wallet-host $WALLET_HOST --wallet-port $WALLET_PORT transfer eosio $name 1000000.0000 "\"fund superhero $name\"";
done < "producers.csv"

exit 0




# Below here doesnt work

/data/bin/master/cleos/cleos -p 8833 --wallet-port 3456 push action eosio delegatebw '{"from":"batman","receiver":"batman","stake_net":"100.0000 EOS","stake_cpu":"1000.0000 EOS","stake_storage":"1000.0000 EOS"}' -p batman

/data/bin/master/cleos/cleos -p 8833 --wallet-port 3456 push action eosio voteproducer '{"voter":"batman","proxy":"","producers":["batman", "storm"]}' -p batman


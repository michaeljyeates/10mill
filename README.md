## EOS Community TestNet

### About
This repo contains needed files to get new EOS Community TestNet Block Producers and Full Nodes off the ground.

### Hardware Requirements
This is still largely unknown.  There is a report of a machine with 2 GB of ram and 1 core producing blocks and not dropping connections.  Most folks are using at least 16g of ram and 4 cpus.

### Software Requirements
There are reports of Ubuntu 16.04, 17.04, and 17.10 working correctly.

### Steps to Stand up new BP

1. Provision server infrastructure
2. Open ports 9876 and 8888 to the world
3. Download [DAWN-2018-01-05](https://github.com/EOSIO/eos/tree/DAWN-2018-01-05)

```
cd ~
git clone https://github.com/eosio/eos --recursive
cd eos
git checkout tags/DAWN-2018-01-05
```

4. Compile

```
./build.sh ubuntu
```
5. Grab the genesis json from this repo

```
sudo mkdir /data
cd /data
sudo wget https://raw.githubusercontent.com/michaeljyeates/10mill/master/genesis.json
```
6. Run eosd to create config.ini file

```
cd ~/eos/build/programs/eosd
./eosd
```
Now kill it with ctrl+c

7. Grab the config.ini from repo

```
cd data-dir
rm config.ini
wget https://raw.githubusercontent.com/michaeljyeates/10mill/master/config.ini
```

8. Procure a public / private key pair for your node

Contact the Community Testnet to request a keypair

9. Fill in the relevant values in the config.ini file

See inline comments

10. Fire it up!

```
./eosd --replay  > community-testnet.log 2>&1 &
tail -F community-testnet.log
```
### Troubleshooting

* if there are errors when starting using the --replay flag, try deleting the data-dir/blocks and data-dir/blockchain directories

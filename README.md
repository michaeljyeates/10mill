## EOS Community TestNet

### About
This repo contains needed files to get new EOS Community TestNet Block Producers off the ground.

### Hardware Requirements
This is still largely unknown.  There is a report of a machine with 2 GB of ram and 1 core producing blocks and not dropping connections.  Most folks are using at least 16g of ram and 4 cpus.

### Software Requirements
There are reports of Ubuntu 16.04, 17.04, and 17.10 working correctly.

### Steps to Stand up new BP

1. Provision server infrastructure
2. Open ports 9876 and 8888 to the world
3. Download [DAWN-2018-01-05](https://github.com/EOSIO/eos/tree/DAWN-2018-01-05)
4. Compile
5. Grab the genesis json from this repo
6. Grab the config.ini from repo
7. Procure a whale account
8. Fill in the relevant values in the config.ini file
9. Fire it up!

### Troubleshooting

* if there are errors when starting using the --replay flag, try deleting the data-dir/blocks and data-dir/blockchain directories

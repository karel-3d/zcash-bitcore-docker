#!/bin/bash 

_term() { 
  echo "Caught SIGTERM signal, killing bitcore" 
  pkill -2 bitcore
  while pgrep bitcore > /dev/null; do sleep 1; done
  echo "Killing bitcore done" 
}

trap _term SIGTERM

cd nodedir/nodedir

/usr/local/lib/node_modules/bitcore-node-zcash/bin/bitcore-node start &

child=$! 
wait "$child"

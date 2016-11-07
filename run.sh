#!/usr/bin/env bash
docker run --name zcash -d -p 80:3002 \
    -v $(pwd)/bitcore/install:/usr/local/lib/node_modules/ \
    -v $(pwd)/bitcore/nodedir:/nodedir \
    -v $(pwd)/params:/root/.zcash-params \
    -v $(pwd)/datadir:/datadir \
    zcash \
    /bin/bash /run_inside.sh



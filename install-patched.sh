#!/usr/bin/env bash
set -ex
docker build -t zcash .

docker run -t \
    -v $(pwd)/bitcore/install:/usr/local/lib/node_modules/ \
    -v $(pwd)/bitcore/nodedir:/nodedir \
    -v $(pwd)/params:/root/.zcash-params \
    -v $(pwd)/datadir:/datadir \
    zcash \
    /bin/sh -c "\
        /fetch-params.sh && \
        npm install -g runn1ng/bitcore-node-zcash && \
        cd nodedir && \
        /usr/local/lib/node_modules/bitcore-node-zcash/bin/bitcore-node create nodedir zcash && \
        cd nodedir && \
        /usr/local/lib/node_modules/bitcore-node-zcash/bin/bitcore-node install str4d/insight-ui-zcash && \
        /usr/local/lib/node_modules/bitcore-node-zcash/bin/bitcore-node install str4d/insight-api-zcash && \
        cp /bitcore-node.json . && \
        cp /zcash.conf /datadir/zcash.conf"



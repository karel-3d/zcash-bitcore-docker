#!/usr/bin/env bash
docker build -t zcash .

docker run -t \
    -v $(pwd)/bitcore/install:/usr/local/lib/node_modules/ \
    -v $(pwd)/bitcore/nodedir:/nodedir \
    -v $(pwd)/datadir:/datadir \
    zcash \
    /bin/sh -c "\
        npm install -g str4d/bitcore-node-zcash && \
        cd nodedir && \
        /usr/local/lib/node_modules/bitcore-node-zcash/bin/bitcore-node create nodedir zcash && \
        cd nodedir && \
        /usr/local/lib/node_modules/bitcore-node-zcash/bin/bitcore-node install str4d/insight-ui-zcash && \
        /usr/local/lib/node_modules/bitcore-node-zcash/bin/bitcore-node install str4d/insight-api-zcash && \
        mv /bitcore-node.json . && \
        mv /zcash.conf /datadir/zcash.conf"



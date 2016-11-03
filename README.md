Scripts for dockerized zcash bitcore
====================================

This repo is for running zcash bitcore (with insight).

Note that the zcashd 1.0.0 binary with bitcore patches is pre-built here for convenience.

Requirements
----
Just docker.

All the scripts work with the assumptions that your user have enough priviledges to run `docker`. If it doesn't, you will need to run with `sudo`.

Getting the binary
------------------
You need to get the binary only once.

Three ways of getting the zcashd binary.

* install [git lfs](https://git-lfs.github.com/) before cloning this repo, it will be in `zcashd` auto-magically

OR 

* `rm zcashd && wget https://github.com/runn1ng/zcash-bitcore-docker/raw/master/zcashd` 

OR

* build it in docker by `cd build && ./run.sh`; note that it takes quite a long time to build.

Install bitcore
-------
`./install.sh` for installing str4d version of bitcore libraries.

`./install-patched.sh` for installing my version of bitcore libraries, with a few patches for socket.io communication.

Clean up node modules between installations.

Clean up
--------
`sudo rm -rf bitcore` for cleaning up node modules (blockchain will stay). You will need to install again.

`sudo rm -rf datadir` for deleting blockchain.

Don't do when running.

Running
-------
`./run.sh`

Insight will be visible at `http://localhost`.

Don't run more than one insight.

Stopping
--------
`docker stop zcash`

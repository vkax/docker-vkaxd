Vkaxd for Docker
================

[![Docker Stats](http://dockeri.co/image/vkaxproject/vkaxd)](https://hub.docker.com/r/vkaxproject/vkaxd/)

[![Build Status](https://travis-ci.org/vkaxproject/docker-vkaxd.svg?branch=master)](https://travis-ci.org/vkaxproject/docker-vkaxd/)


Docker image that runs the Vkax vkaxd node in a container for easy deployment.


Requirements
------------

* Physical machine, cloud instance, or VPS that supports Docker (i.e. Vultr, Digital Ocean, KVM or XEN based VMs) running Ubuntu 18.04 or later (*not OpenVZ containers!*)
* At least 40 GB to store the block chain files
* At least 2 GB RAM + 2 GB swap file


Really Fast Quick Start
-----------------------

One liner for Ubuntu 18.04 LTS machines with JSON-RPC enabled on localhost and adds upstart init script:

    curl https://raw.githubusercontent.com/vkaxproject/docker-vkaxd/master/bootstrap-host.sh | sh -s bionic


Quick Start
-----------

1. Create a `vkaxd-data` volume to persist the vkaxd blockchain data, should exit immediately.  The `vkaxd-data` container will store the blockchain when the node container is recreated (software upgrade, reboot, etc):

        docker volume create --name=vkaxd-data
        docker run -v vkaxd-data:/vkax --name=vkaxd-node -d \
            -p 11110:11110 \
            -p 127.0.0.1:11111:11111 \
            vkaxproject/vkaxd

2. Verify that the container is running and vkaxd node is downloading the blockchain

        $ docker ps
        CONTAINER ID        IMAGE                         COMMAND             CREATED             STATUS              PORTS                                              NAMES
        d0e1076b2dca        vkaxproject/vkaxd:latest          "vkax_mike"      2 seconds ago       Up 1 seconds        127.0.0.1:11111->11111/tcp, 0.0.0.0:11110->11110/tcp   vkaxd-node

3. You can then access the daemon's output thanks to the [docker logs command]( https://docs.docker.com/reference/commandline/cli/#logs)

        docker logs -f vkaxd-node

4. Install optional init scripts for upstart and systemd are in the `init` directory.


Documentation
-------------

* To run in testnet, add environment variable `TESTNET=1` to `docker run` as such:

        docker run -v vkaxd-data:/vkax --name=vkaxd-node -d \
            --env TESTNET=1 \
            -p 11110:11110 \
            -p 127.0.0.1:11111:11111 \
            vkaxproject/vkaxd

* Additional documentation in the [docs folder](docs).

Credits
-------

Original work by Kyle Manna [https://github.com/kylemanna/docker-bitcoind](https://github.com/kylemanna/docker-bitcoind).
Modified to use Vkax Core instead of Bitcoin Core.


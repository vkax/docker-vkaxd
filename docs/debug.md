# Debugging

## Things to Check

* RAM utilization -- vkaxd is very hungry and typically needs in excess of 1GB.  A swap file might be necessary.
* Disk utilization -- The vkax blockchain will continue growing and growing and growing.  Then it will grow some more.  At the time of writing, 2GB+ is necessary.

## Viewing vkaxd Logs

    docker logs vkaxd-node


## Running Bash in Docker Container

*Note:* This container will be run in the same way as the vkaxd node, but will not connect to already running containers or processes.

    docker run -v vkaxd-data:/vkax --rm -it vkaxproject/vkaxd bash -l

You can also attach bash into running container to debug running vkaxd

    docker exec -it vkaxd-node bash -l



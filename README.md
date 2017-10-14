# rpi-unbound
Unbound - caching, DNSSEC validating DNS Server for Raspberry Pi

## General Usage

Pull the latest Version of the Docker Image from Docker Hub
```
docker pull gorofad/rpi-unbound:latest
```
Run the container with:

```
docker run  -d -p 53:53 -p 53:53/udp --name unbound -v /path/to/unbound/conf:/etc/unbound/unbound.conf.d:ro --restart always gorofad/rpi-unbound:latest
```

## Adding local adresses
If you want to add the host name of for example your router or nas rename the file `conf/04_HomeZone.conf.sample` to `conf/04_HomeZone.conf` and edit the content. Afterwards just start the container as usual.

## Debug your container
To get a log file from Unbound rename `conf/00_Debug.conf.sample` to `conf/00_Debug.conf` and start the container with the following command:
```
docker run  -d -p 53:53 -p 53:53/udp --name unbound -v /path/to/unbound/conf:/etc/unbound/unbound.conf.d:ro -v /path/where/logfile/should/go:/data/log/unbound.log:rw gorofad/rpi-unbound:latest
```

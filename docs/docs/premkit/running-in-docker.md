+++
date = "2016-07-07T00:00:00Z"
weight = "2003"
title = "Running PremKit in Docker"

[menu.main]
Name       = "Running PremKit in Docker"
identifier = "running-in-docker"
parent     = "premkit"
url        = "/docs/premkit/running-in-docker"
+++

A popular way to distribute PremKit is to ship a Docker container. You can start a container from the [official PremKit 
image](https://hub.docker.com/r/premkit/premkit/) in DockerHub. An explanation of our tagging strategy is below:  

| Tag | Description |
|-----|-------------|
| latest | Absolute latest build. This version has passed automated tests, but pulling this tag will always result in the latest image. |
| 0.1.0 | Current stable version. Currently, PremKit is at version 0.1.0 and this tag represents the most stable release of this version. |

To run PremKit in Docker, follow the normal Docker process, but PremKit is 12-factor aware and can be configured using 
environment variables easily:

```shell
docker run \
  --detach \
  --name premkit \
  -e PREMKIT_DATA_FILE=/data/premkit.db \
  -v /premkit/data:/data \
  -p 9080:80 \
  -p 9443:443 \
  premkit/premkit
``` 

Using the `docker run` command above, PremKit will listen for insecure connections on port 9080 and TLS enabled connections on port 9443. PremKit 
will also use the `/premkit/data` folder on the host to store persistence data.


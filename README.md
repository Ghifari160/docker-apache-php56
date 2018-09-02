# A Better PHP Image for Docker #
[![Docker Hub: ghifari160/apache-php56](https://img.shields.io/badge/docker%20hub-ghifari160%2Fapache--php56-ABD8EB.svg)](https://hub.docker.com/r/ghifari160/apache-php56)
[![](https://images.microbadger.com/badges/image/ghifari160/apache-php56.svg)](https://microbadger.com/images/ghifari160/apache-php56 "Get your own image badge on microbadger.com")

This image is not just another PHP5.6 image for Docker.

Looking for a PHP5.5 image for Docker? Check [ghifari160/apache-php55].

## Why Use This Image ##
This image is based on [ghifari160/apache], which forces Apache to run in the
foreground and output its log into the container's stdio.

## Installation ##
By default, this image should be run as a daemon.
```
docker run -d -p 8080:80 ghifari160/apache-php56
```
However, this image may be run in the foreground for debug purposes.
```
docker run -i -p 8080:80 ghifari160/apache-php56
```

### Further Configurations ###
#### Name your container ####
Add this parameter: `--name <name>`  
Example:
```
docker run --name apache-php56 -d -p 8080:80 ghifari160/apache-php56
```

#### Run your code from a folder on the host computer ####
Add this parameter: `--v /path/on/the/host/computer:/var/www/html`  
Example:
```
docker run -v -d -p 8080:80 /d/workspace/project:/var/www/html ghifari160/apache-php56
```

#### Change the port on your container ####
Use the parameter `-p <port on the host>:80` to map the container's port to
another port on the host computer.  
Example:
```
docker run -d -p 8080:80 ghifari160/apache-php56
```

#### macOS permission fixes
On macOS, shared volumes remains owned by the host user and group. Permissions
on these shared volumes are also determined by the host, unchangeable from
guest. On the home directory, the default owner and permission are
`<user>:staff` and `755`. Apache needs write access to its files and
directories. A workaround is to set the `www-data` UID and GID to `1000` and
`50`. The init script will do this if the value of `G16_MACOS` is `yes`. Use
the parameter `-e G16_MACOS=yes` to enable this workaround. Example:
```
docker run -d -e G16_MACOS=yes ghifari160/apache
```

## Tags ##
| Tags                      | Ubuntu Version | Size              |
|---------------------------|----------------|-------------------|
| `16.04` `xenial`          | 16.04          | [![](https://images.microbadger.com/badges/image/ghifari160/apache-php56:16.04.svg)](https://microbadger.com/images/ghifari160/apache-php56:16.04 "Get your own image badge on microbadger.com")|
| `17.10` `artful`          | 17.10          | **NOT SUPPORTED** |
| `latest` `18.04` `bionic` | 18.04          |[![](https://images.microbadger.com/badges/image/ghifari160/apache-php56.svg)](https://microbadger.com/images/ghifari160/apache-php56 "Get your own image badge on microbadger.com")|

[ghifari160/apache]: https://github.com/ghifari160/docker-apache
[ghifari160/apache-php55]: https://github.com/ghifari160/docker-apache-php55

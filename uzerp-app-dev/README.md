# uzERP Development Image

`podman pull ghcr.io/uzerpllp/uzerp-app-dev:latest`

On github: https://github.com/uzerpllp/uzerp-containers

This image is based on the [official PHP image](https://hub.docker.com/_/php), apache variant, and contains everything needed to run the uzERP ERP application:

* All required PHP extensions, including Xdebug
* Apache FOP with Barcode4j and qpdf

*Note that uzERP needs access to a postgresql database server.*

Example usage:

```
$ podman run --pod uzerp-pod --name uzerp-app-dev --security-opt label=disable \
-v /home/uzerp:/var/www/html:rw \
--env XDEBUG_CONFIG="remote_host=198.51.100.1 remote_port=9000" -e TZ="Europe/London" \
-d quay.io/uzerp/uzerp-app-dev
```

To allow the Apache www-data user inside the container to create required files and directories, set an ACL on the uzERP source data directory:

```
$ setfacl -R -m "u:100032:rwx" /home/uzerp/data
```

*Note that the above ACL assumes the container is run under rootless podman with a user namespace*

**uzERP is an Open Source ERP system for UK based SMEs.**

* https://www.uzerp.com
* https://github.com/uzerpllp/uzerp

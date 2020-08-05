# uzERP Frepple Image

[![Docker Repository on Quay](https://quay.io/repository/uzerp/uzerp-frepple/status "Docker Repository on Quay")](https://quay.io/repository/uzerp/uzerp-frepple)

On github: https://github.com/uzerpllp/uzerp-containers

This image is based on the official Ubuntu image and contains a ready to run Frepple application:

* Frepple Django application runs under gunicorn on port 5000 with static files served by whitenoise
* Frepple solver compiled
* uzERP ERP connector installed

*Note that Frepple needs access to a postgresql database server.*

Example usage:

```
$ podman run --pod uzerp-pod --name uzerp-frepple --security-opt label=disable \
-v /home/uzerp/.local/share/uzerp/frepple/logs:/app/frepple/logs:rw \
-v /home/uzerp/.config/uzerp/frepple/etc:/etc/frepple:ro \
-e TZ=Europe/London \
-d quay.io/uzerp/uzerp-frepple
```

The folder `/home/uzerp/.config/uzerp/frepple/etc` should contain a `djangosettings.py` file with appropriate settings for your database, etc. A copy can be extracted from the image using the following command:

```
$ podman run --rm -i --entrypoint="" uzerp-frepple cat /app/frepple/djangosettings.py > djangosettings.py
```

**uzERP is an Open Source ERP system for UK based SMEs.**

* https://www.uzerp.com
* https://github.com/uzerpllp/uzerp

**Frepple ia an Open Source Advanced Planning and Scheduling (APS) system**

* https://frepple.org/
* https://github.com/frePPLe/frepple
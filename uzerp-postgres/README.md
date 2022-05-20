# uzERP PostgreSQL Image

`podman pull ghcr.io/uzerpllp/uzerp-postgres:latest`

On github: https://github.com/uzerpllp/uzerp-containers

This image is based on the [official PostgreSQL image](https://hub.docker.com/_/postgres), localized to en_GB.UTF-8.

Example usage:

```
$ podman run -d --pod uzerp-pod --name uzerp-postgres --security-opt label=disable \
-v /home/uzerp/postgres/postgres.conf:/etc/postgresql/postgresql.conf \
-v /home/uzerp/.local/share/uzerp/postgres/data:/var/lib/postgresql/data \
-e TZ=Europe/London -e PGTZ=Europe/London \
-e POSTGRES_PASSWORD=xxx quay.io/uzerp/uzerp-postgres \
-c "config_file=/etc/postgresql/postgresql.conf"
```
## Adding a uzERP database

Create required roles:

```
$ podman exec -i uzerp-postgres psql -U postgres -c "create user \"www-data\"  with encrypted password 'xxx';"

$ podman exec -i uzerp-postgres psql -U postgres -c "create user sysadmin  with encrypted password 'sysadmin';"

$ podman exec -i uzerp-postgres psql -U postgres -c "ALTER USER sysadmin WITH SUPERUSER;"
podman exec -i uzerp-postgres psql -U postgres -c "create user \"ooo-data\"  with encrypted password 'data';"

$ podman exec -i uzerp-postgres psql -U postgres -c "create user readonly  with encrypted password 'data';"
```


## Create demo database

```
$ podman exec -i uzerp-postgres psql -U postgres -c 'create database uzerp;'

$ podman exec -i uzerp-postgres pg_restore -U postgres --dbname=uzerp < [source code directory]/schema/database/postgresql/uzerp-demo-dist.sql
```

**uzERP is an Open Source ERP system for UK based SMEs.**

* https://www.uzerp.com
* https://github.com/uzerpllp/uzerp

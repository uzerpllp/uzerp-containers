FROM ubuntu:18.04

LABEL "maintainer"="Steve Blamey <sblamey@uzerp.com>"
LABEL "frepple_version"="6.4.0"

ENV ACLOCAL_PATH="/usr/share/aclocal:/usr/bin"
ENV LD_LIBRARY_PATH="/usr/local/lib"

RUN groupadd -g 1000 frepple
RUN useradd -u 1000 -g 1000 frepple

RUN apt-get update
RUN apt-get -y install python3 python3-pip gcc autoconf libtool libxerces-c-dev python3-dev wget git
RUN pip3 --no-cache-dir install wheel psycopg2-binary gunicorn whitenoise
RUN pip3 --no-cache-dir install git+https://github.com/uzerpllp/uzerpfrepple.git

RUN mkdir /app
RUN wget https://github.com/frePPLe/frepple/archive/6.4.0.tar.gz
RUN tar -xf /6.4.0.tar.gz -C /app
RUN mv /app/frepple-6.4.0 /app/frepple
RUN pip3 --no-cache-dir install -r /app/frepple/requirements.txt

WORKDIR /app/frepple
RUN python3 frepplectl.py collectstatic
RUN bash -c 'autoreconf -i && ./configure --sysconfdir=/etc'

WORKDIR /app/frepple/src
RUN bash -c 'make && make install'

# Ensure these packages are kept, otherwise gunicorn will not run
RUN apt-mark manual python3-setuptools python3-six

# Remove unwanted packages
RUN apt-get -y remove --purge python3-pip gcc autoconf libtool libxerces-c-dev python3-dev wget git
RUN apt-get clean

RUN chown -R 1000:1000 /app/frepple/logs
WORKDIR /app/frepple
ENTRYPOINT gunicorn freppledb.wsgi -u frepple -b localhost:5000


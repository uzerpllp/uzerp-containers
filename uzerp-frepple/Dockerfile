FROM ubuntu:20.04

ARG FREPPLE_VERSION="6.22.0"

LABEL "maintainer"="Steve Blamey <sblamey@uzerp.com>"
LABEL "frepple_version"="$FREPPLE_VERSION"

ENV TZ=Europe/London

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN groupadd -g 1000 frepple
RUN useradd -u 1000 -g 1000 frepple

# Install required packages and python pre-requisites
RUN apt-get update
RUN apt-get -y install python3 python3-pip python3-setuptools gcc cmake libtool libxerces-c-dev libpq-dev wget git
RUN pip3 install -U pip
RUN pip3 --no-cache-dir install wheel psycopg2-binary gunicorn whitenoise
RUN pip3 --no-cache-dir install git+https://github.com/uzerpllp/uzerpfrepple.git

# Install frepple and dependencies
RUN mkdir /app
RUN wget https://github.com/frePPLe/frepple/archive/$FREPPLE_VERSION.tar.gz
RUN tar -xf /$FREPPLE_VERSION.tar.gz -C /app
RUN mv /app/frepple-$FREPPLE_VERSION /app/frepple
RUN pip3 --no-cache-dir install -r /app/frepple/requirements.txt
WORKDIR /app/frepple
RUN python3 frepplectl.py collectstatic

# Build the frepple solver
RUN mkdir build
WORKDIR /app/frepple/build
RUN cmake .. && cmake --build . --config Release && cmake --install .
RUN rm -rf /app/frepple/build

# Ensure these packages are kept, otherwise gunicorn will not run
RUN apt-mark manual python3-setuptools python3-six

# Remove un-needed packages
RUN apt-get -y remove --purge python3-pip python3-setuptools gcc cmake libtool libxerces-c-dev python3-dev libpq-dev wget git
RUN apt-get clean

RUN chown -R 1000:1000 /app/frepple/logs
WORKDIR /app/frepple
ENTRYPOINT gunicorn freppledb.wsgi \
           --workers=2 --threads=4 \
           --worker-class=gthread \
           --worker-tmp-dir /dev/shm \
           --preload --log-level debug \
           --user frepple \
           --bind 0.0.0.0:5000


FROM ubuntu:18.04

ARG PYTHON_VERSION=3.6.8
RUN mkdir -p /tmp/python-src/Python-$PYTHON_VERSION
WORKDIR /tmp/python-src/Python-$PYTHON_VERSION

RUN apt-get update && \
    apt-get install -y wget gcc libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev libffi-dev libxml2-dev libxslt1-dev uuid-dev && \
    wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz -O /tmp/python.tgz && \
    tar -zxvf /tmp/python.tgz -C /tmp/python-src && \
    ./configure --prefix=/usr/ LDFLAGS="-Wl,-rpath /usr/lib" --with-ensurepip=install --enable-shared --enable-optimizations --with-lto && \
    make && \
    make altinstall && \
    rm -rf /tmp/python.tgz /tmp/python-src

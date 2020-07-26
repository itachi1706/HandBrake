#! /bin/sh

if [ "$TARGETARCH" = "amd64" ]
then
    echo "[BUILD] x86 builds do not require compiling numa. We are adding it automatically"
    apk add --no-cache numactl-dev
else
    echo "[BUILD] Compiling numa"
    cd /opt
    git clone https://github.com/numactl/numactl.git
    cd numactl
    ./autogen.sh
    ./configure
    make
    make install
    echo "[BUILD] numactl compiled successfully!"
fi
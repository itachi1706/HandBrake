# Must build with buildx (Not sure if you try to build this with normal docker build what will happen)

FROM --platform=$BUILDPLATFORM ubuntu:bionic AS build

ARG TARGETARCH
ARG TARGETPLATFORM

RUN apt-get update && apt-get install -y autoconf automake autopoint build-essential cmake git libass-dev libbz2-dev libfontconfig1-dev libfreetype6-dev libfribidi-dev libharfbuzz-dev libjansson-dev liblzma-dev libmp3lame-dev libnuma-dev libogg-dev libopus-dev libsamplerate-dev libspeex-dev libtheora-dev libtool libtool-bin libvorbis-dev libx264-dev libxml2-dev libvpx-dev m4 make nasm ninja-build patch pkg-config python tar zlib1g-dev
RUN apt-get install -y python3-pip && pip3 install meson

ADD . /opt/Handbrake
WORKDIR /opt/Handbrake

# 1.3.x release latest
RUN git tag --list | grep ^1\.3\. && git checkout refs/tags/$(git tag -l | grep -E '^1\.3\.[0-9]+$' | tail -n 1) && echo "Building for $TARGETARCH ($TARGETPLATFORM)"

RUN if [ "$TARGETARCH" = "arm" ] ; then \
    ./configure --launch-jobs=$(nproc) --launch --disable-gtk --disable-nvenc --disable-x265 \
  else \
    ./configure --launch-jobs=$(nproc) --launch --disable-gtk \
  fi
 
RUN make --directory=build install

FROM --platform=$BUILDPLATFORM ubuntu:bionic

COPY --from=build /usr/local/bin/HandBrakeCLI /usr/local/bin/HandBrakeCLI

ARG TARGETARCH

RUN if [ "$TARGETARCH" = "arm" ] ; then \
    apt-get update && apt-get install -y libass9 libmp3lame0 libvpx5 libtheora0 libvorbis0a libvorbisenc2 libx264-152 libjansson4 libopus0 libspeex1 libnuma1 \
  else \
    apt-get update && apt-get install -y libass9 libmp3lame0 libvpx5 libtheora0 libvorbis0a libvorbisenc2 libx264-152 libjansson4 libopus0 libspeex1 libnuma1 libnvidia-encode-440 \
  fi
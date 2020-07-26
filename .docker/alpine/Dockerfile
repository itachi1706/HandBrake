FROM alpine AS build

ARG TARGETARCH

RUN apk add --no-cache alpine-sdk autoconf automake cmake fontconfig-dev freetype-dev fribidi-dev gettext git harfbuzz-dev jansson-dev lame-dev libass-dev libbz2 libjpeg-turbo-dev libogg-dev libsamplerate-dev libtheora-dev libtool libvorbis-dev libvpx-dev libxml2-dev m4 make meson nasm ninja opus-dev patch pkgconfig python2 speex-dev tar x264-dev xz-dev zlib-dev
 
ADD . /opt/Handbrake
WORKDIR /opt/Handbrake

RUN chmod +x .docker/alpine/numactl.sh && .docker/alpine/numactl.sh

RUN ./configure --launch-jobs=$(nproc) --launch --disable-gtk --disable-nvenc
RUN make --directory=build install

FROM alpine

COPY --from=build /usr/local/bin/HandBrakeCLI /usr/local/bin/HandBrakeCLI

RUN apk add --no-cache jansson lame libass libjpeg-turbo libstdc++ libtheora libvorbis libvpx libxml2 numactl opus speex x264-dev

CMD ["HandBrakeCLI", "--version"]
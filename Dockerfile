# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-arch:latest

#    aws-cli \
#    awsebcli \
#    s3cmd
RUN \
  echo "**** install runtime packages ****" && \
  pacman -Sy --noconfirm --needed \
    openssh \
    rsnapshot \
    rsync \
    gnupg \
    nano \
    pigz \
    run-parts \
    s3cmd \
    aws-cli \
    zstd && \
  echo "**** cleanup ****" && \
  ln -s /usr/lib/gettext/hostname /bin/hostname && \
  ln -s /usr/bin/busybox /usr/sbin/crond && \
  rm -rf \
      /tmp/* \
      /var/cache/pacman/pkg/* \
      /var/lib/pacman/sync/*
#  pacman -Rsn --noconfirm $(pacman -Qdtq) &&

# copy local files
COPY root/ /

# ports and volumes
VOLUME /config

# Relod production container
#
# VERSION               0.0.1

FROM        kylemanna/openvpn
MAINTAINER  Riccardo De Leo <riccardo.deleo@covianalytics.com>
LABEL       Description="This image is used to run an openvpn gateway to roffice virtual network " Vendor="CoviAnalytics" Version="0.0.1"

# openvpn related
RUN apk update && \
    apk --no-cache add \
    ip6tables

COPY ./env/00-alpine.conf /etc/sysctl.d/00-alpine.conf
RUN sysctl -p

COPY ./etc/getclient_ovpn.sh /usr/bin/getclient_ovpn
RUN chmod +x /usr/bin/getclient_ovpn

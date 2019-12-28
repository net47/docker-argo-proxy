FROM debian:buster-slim

RUN apt-get -yqq update
WORKDIR /opt/argo

# Supervisord

RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /etc/supervisor/conf.d/

# Cloudflared

RUN apt-get install -y wget
RUN wget -O- https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz | tar xz
RUN mkdir -p /etc/cloudflared/

# Main

CMD ["/usr/bin/supervisord"]

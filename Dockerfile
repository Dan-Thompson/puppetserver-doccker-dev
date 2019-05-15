FROM debian:latest
MAINTAINER Daniel Thompson

EXPOSE 8140

RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

###
# Define working directory.
WORKDIR /root

RUN apt update && apt install -y wget vim && wget https://apt.puppetlabs.com/puppet6-release-stretch.deb
RUN dpkg -i puppet6-release-stretch.deb
RUN apt update && apt install -y puppetserver

# Set environment variables.
ENV HOME /root

VOLUME puppet

COPY ./start.sh /root/start.sh
COPY certs/ /var/lib/puppet/ssl
ENTRYPOINT ["/root/start.sh"]

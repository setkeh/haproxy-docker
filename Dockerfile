FROM alpine:3.5

MAINTAINER James <setkeh> Griffis <setkeh@setkeh.com>

# Setting Environment Variables
ENV PACKAGES="socat pcre ca-certificates openssl wget haproxy"

# Update the System and Install Required Packages
RUN apk update
RUN apk add ${PACKAGES}

# Setup the Mountable Volumes
VOLUME ["/usr/local/etc/haproxy"]

# Set the container entrypoint
ENTRYPOINT ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
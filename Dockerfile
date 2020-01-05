FROM ubuntu:18.04
ADD deps /app/deps
RUN dpkg -i /app/deps/libbcg729*
RUN apt-get update && apt-get install -qy dpkg-dev devscripts debhelper=12* \
	default-libmysqlclient-dev iptables-dev libbcg729-dev libsystemd-dev \
	libavcodec-dev libavfilter-dev libavformat-dev libavutil-dev libswresample-dev  libcurl4-openssl-dev libevent-dev \
	libglib2.0-dev libhiredis-dev libjson-glib-dev libpcap-dev libpcre3-dev libssl-dev libxmlrpc-core-c3-dev \
	zlib1g-dev libspandsp-dev markdown gperf \
	libbencode-perl libcrypt-openssl-rsa-perl libcrypt-rijndael-perl libdigest-crc-perl libio-multiplex-perl libnet-interface-perl
ARG SOURCEDIR
WORKDIR /app/src/$SOURCEDIR
ADD $SOURCEDIR /app/src/$SOURCEDIR
RUN DEBEMAIL=ops@cloudonix.io DEBFULLNAME="Cloudonix Operations" dch -D unstable -l-cx -U 'Always restart rtpengine service when down'
RUN find . -type l -exec rm -f {} \;
RUN find . -name .depend -exec rm -f {} \;
RUN make clean all
RUN make check

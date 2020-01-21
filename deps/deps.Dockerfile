FROM ubuntu:18.04
ADD . /app/deps
RUN dpkg -i /app/deps/libbcg729*
RUN apt-get update && apt-get install -qy dpkg-dev devscripts debhelper=12* \
	default-libmysqlclient-dev iptables-dev libbcg729-dev libsystemd-dev \
	libavcodec-dev libavfilter-dev libavformat-dev libavutil-dev libswresample-dev  libcurl4-openssl-dev libevent-dev \
	libglib2.0-dev libhiredis-dev libjson-glib-dev libpcap-dev libpcre3-dev libssl-dev libxmlrpc-core-c3-dev \
	zlib1g-dev libspandsp-dev markdown gperf \
	libbencode-perl libcrypt-openssl-rsa-perl libcrypt-rijndael-perl libdigest-crc-perl libio-multiplex-perl libnet-interface-perl

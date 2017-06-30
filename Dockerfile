FROM scratch
MAINTAINER Gardner Bickford <gbickford@gmail.com>
ADD root.tar.xz /

RUN echo "deb http://mirrordirector.raspbian.org/raspbian/ jessie main contrib non-free rpi" > /etc/apt/sources.list 

RUN apt-get update \
	&& apt-get -y upgrade \
	&& apt-get -y --purge autoremove \
	&& apt-get clean \
	&& find /var/lib/apt/lists -type f -delete

CMD ["/bin/bash"]

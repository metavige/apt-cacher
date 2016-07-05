FROM ubuntu:trusty

VOLUME ["/var/cachr/apt-cacher-ng"]

RUN sed -i 's/archive.ubuntu.com/free.nchc.org.tw/g' /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -qy apt-cacher-ng \
	&& echo "chmod 777 /var/cache/apt-cacher-ng; " + \
		"/etc/init.d/apt-cacher-ng start; " + \
		"tail -f /var/log/apt-cacher-ng/*" >> /init.sh

EXPOSE 3142

CMD ["/bin/bash", "/init.sh"]
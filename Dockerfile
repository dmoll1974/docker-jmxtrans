FROM  java:8u45-jdk

MAINTAINER fvigotti

RUN echo "debconf debconf/frontend select noninteractive" | debconf-set-selections
RUN wget http://central.maven.org/maven2/org/jmxtrans/jmxtrans/250/jmxtrans-250.deb
RUN dpkg -i jmxtrans-250.deb


ADD run-jmxtrans.sh /usr/bin/run-jmxtrans.sh

RUN chmod +x /usr/bin/run-jmxtrans.sh

ADD sources/jboss/jars/*  /usr/share/jmxtrans/jboss/

ADD sources/jboss.json /var/lib/jmxtrans/jboss.json

# default json confs dir
VOLUME ["/var/lib/jmxtrans"]

# default logs dir
VOLUME ["/var/log/jmxtrans"]

CMD /usr/bin/run-jmxtrans.sh


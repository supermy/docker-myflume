FROM supermy/docker-jre:7


RUN mkdir /opt/flume
#RUN wget -qO- http://archive.apache.org/dist/flume/1.6.0/apache-flume-1.6.0-bin.tar.gz \
#  | tar zxvf - -C /opt/flume --strip 1

WORKDIR /tmp
RUN wget http://archive.apache.org/dist/flume/1.6.0/apache-flume-1.6.0-bin.tar.gz
RUN tar zxvf apache-flume-1.6.0-bin.tar.gz -C /opt/flume --strip 1



COPY conf /var/tmp/
COPY lib /opt/flume/lib/


RUN cat /etc/hosts

RUN  echo "192.168.59.103 hbasemasteripc" >> /etc/hosts


ADD start-flume.sh /opt/flume/bin/start-flume
RUN chmod a+x /opt/flume/bin/start-flume
ENV PATH /opt/flume/bin:$JAVA_HOME/bin:$PATH

CMD [ "start-flume" ]

EXPOSE 44444
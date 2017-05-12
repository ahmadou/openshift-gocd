FROM atbentley/nss-wrapper:centos7
EXPOSE 8153 8154

RUN echo $'[gocd] \n\
name     = GoCD YUM Repository\n\
baseurl  = https://download.gocd.io\n\
enabled  = 1\n\
gpgcheck = 1\n\
gpgkey   = https://download.gocd.io/GOCD-GPG-KEY.asc' > /etc/yum.repos.d/gocd.repo && \
yum install -y java-1.8.0-openjdk git go-server && yum clean all -y

ADD start.sh /start.sh

RUN chgrp -R 0 /var/lib/go-server /etc/go /usr/share/go-server /var/log/go-server /etc/default/go-server /var/run/go-server /start.sh && \
chmod -R g+rw /var/lib/go-server /etc/go /usr/share/go-server /var/log/go-server /etc/default/go-server /var/run/go-server /start.sh

WORKDIR /var/lib/go-server
ENV USER_NAME=go

CMD ["/start.sh"]
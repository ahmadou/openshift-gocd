FROM atbentley/nss-wrapper:centos7

RUN echo $'[gocd] \n\
name     = GoCD YUM Repository\n\
baseurl  = https://download.gocd.io\n\
enabled  = 1\n\
gpgcheck = 1\n\
gpgkey   = https://download.gocd.io/GOCD-GPG-KEY.asc' > /etc/yum.repos.d/gocd.repo && \
yum install -y java-1.8.0-openjdk git go-agent && yum clean all -y

ADD start.sh /start.sh

RUN chgrp -R 0 /var/lib/go-agent /usr/share/go-agent /var/log/go-agent /etc/default/go-agent /var/run/go-agent /start.sh && \
chmod -R g+rw /var/lib/go-agent /usr/share/go-agent /var/log/go-agent /etc/default/go-agent /var/run/go-agent /start.sh

WORKDIR /usr/share/go-agent
ENV DAEMON=N PRODUCTION_MODE=N USER_NAME=go

CMD ["/start.sh"]
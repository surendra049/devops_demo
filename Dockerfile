FROM registry.access.redhat.com/ubi8/ubi:8.1

RUN yum --disableplugin=subscription-manager -y install httpd \
  && yum --disableplugin=subscription-manager clean all

ADD index.html /var/www/html

RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf \
#  && sed -i 's/listen.acl_users = apache,nginx/listen.acl_users =/' /etc/php-fpm.d/www.conf \
#  && mkdir /run/php-fpm \
#  && chgrp -R 0 /var/log/httpd /var/run/httpd /run/php-fpm \
#  && chmod -R g=u /var/log/httpd /var/run/httpd /run/php-fpm
#
  && chgrp -R 0 /var/log/httpd /var/run/httpd \
  && chmod -R g=u /var/log/httpd /var/run/httpd  
  
EXPOSE 8080 8081
USER root
CMD httpd -D FOREGROUND

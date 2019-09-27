# This is a comment line
FROM rhel7:7.7

LABEL description="This is a custom httpd container image"
MAINTAINER Sergei Popenko <siggepop@gmail.com>

RUN yum update -y && \
yum install -y httpd && \
yum clean all

RUN chown -R apache:apache /etc/httpd/logs/ && \
chown -R apache:apache /run/httpd/

EXPOSE 80

ENV Loglevel "info"

COPY ./src /var/www/html

USER apache

#ENTRYPOINT ["/usr/sbin/httpd"]
CMD ["httpd", "-D", "FOREGROUND"]

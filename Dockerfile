#
# LAMP Base
#
# 20150223
#   CentOS 6.6 +epel +remi
#   Apache 2.2.15
#   MySQL 5.6.23
#   PHP 5.6.6

FROM centos:6
MAINTAINER teruchi

# update yum
RUN yum update -y && \
    yum clean all

# epel repo
RUN yum install -y http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && \
    yum clean all
COPY epel.repo /etc/yum.repos.d/

# remi repo
RUN yum install -y http://rpms.famillecollet.com/enterprise/remi-release-6.rpm && \
    yum clean all
COPY remi.repo /etc/yum.repos.d/

# mysql repo
RUN yum install -y http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm && \
    yum clean all

RUN yum install -y httpd php mysql php-mysqlnd && \
    yum clean all


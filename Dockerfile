FROM centos:latest
MAINTAINER zaryabaig55@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
  zip \
  unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page294/artxibition.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip artxibition.zip
RUN cp -rvf 2125_artxibition/*
RUN rm -rf __MACOSX 2125_artxibition artxibition.zip
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80

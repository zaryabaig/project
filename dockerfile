FROM centos:latest
RUN yum install -y httpd \
  zip \
  unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page294/artxibition.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip artxibition.zip
RUN cp -rvf 2125_artxibition/*
RUN rm -rf __MACOSX 2125_artxibition artxibition.zip
CMD ["/usr/bin/httpd", "-D" "FOREGROUND" ]
EXPOSE 80

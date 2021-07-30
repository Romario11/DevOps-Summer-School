FROM alpine:latest
RUN  apk update && apk upgrade && \
     apk add apache2
EXPOSE 3000
COPY index.html /var/www/localhost/htdocs/index.html
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

FROM alpine:latest

LABEL   maintaner "Maros Hrivnak <maros.hrivnak.sk@gmail.com>" \
        environment "stage"

RUN apk update && apk add apache2

COPY index.html /var/www/localhost/htdocs

EXPOSE 8080

RUN sed -i "s/80/8080/" /etc/apache2/httpd.conf

CMD ["-D","FOREGROUND"]

ENTRYPOINT ["/usr/sbin/httpd"]
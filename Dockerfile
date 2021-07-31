FROM debian:buster
RUN apt-get update -y && \
apt-get upgrade -y && \
apt-get install -y nginx \
mariadb-server \
php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-cgi php7.3-mbstring \
wget zip tar

ARG autoindex=1
ENV var_autoindex=${autoindex}
COPY srcs/start.sh /root
COPY srcs/config.inc.php /root
COPY srcs/ssl.conf /etc/nginx/sites-available/localhost.conf
COPY srcs/wordpress.tar.gz /root
COPY srcs/phpMyAdmin.zip /root

RUN chmod u+x /root/start.sh
CMD ["/root/start.sh"]
EXPOSE 80
EXPOSE 443

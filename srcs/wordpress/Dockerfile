# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nsylwa <nsylwa@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/04 17:21:36 by nsylwa            #+#    #+#              #
#    Updated: 2020/11/07 18:51:32 by nsylwa           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest
LABEL maintainer="nsylwa@student.42.fr"

# INSTALL UTILS
RUN apk update && apk upgrade
RUN apk add wget nginx supervisor php7 php7-fpm php7-cgi php7-mysqli

RUN apk add vim

# CREATE FOLDERS
RUN mkdir /var/www/nsylwa
RUN mkdir -p /run/nginx

# DOWNLOAD WP
RUN wget https://wordpress.org/latest.zip
RUN unzip latest.zip
RUN rm -rf latest.tar.gz
RUN mv /wordpress /var/www/nsylwa/

# INIT CONFIGS
COPY /nginx.conf /etc/nginx/conf.d/default.conf
COPY /wp-config.php /var/nsylwa/wordpress/
COPY /start.sh /home/srcs/
COPY /supervisor.conf /etc/supervisord.conf

# START
RUN chmod u+x /home/srcs/start.sh
CMD /home/srcs/start.sh

EXPOSE 80 443 22
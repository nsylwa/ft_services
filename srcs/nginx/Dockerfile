# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nsylwa <nsylwa@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/04 17:21:36 by nsylwa            #+#    #+#              #
#    Updated: 2020/11/07 19:09:52 by nsylwa           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest
LABEL maintainer="nsylwa@student.42.fr"

# INSTALL UTILS
RUN apk update && apk upgrade
RUN apk add nginx openssl openssh openrc supervisor

RUN adduser -D nsylwa
RUN echo "nsylwa:pass" | chpasswd

RUN apk add vim

# CREATE FOLDERS
RUN mkdir /var/www/nsylwa
RUN mkdir -p /run/nginx

# INIT CONFIGS
COPY /nginx.conf /etc/nginx/conf.d/default.conf
COPY /start.sh /home/srcs/
COPY /supervisor.conf /etc/supervisord.conf

# INIT SSL CERTIFICATE
RUN openssl req -x509 -nodes -days 14 -newkey rsa:2048 \
	-keyout /etc/ssl/nsylwa_key.key \
	-out /etc/ssl/nsylwa_crt.crt \
	-subj "/C=RU/ST=Moscow/L=Moscow/O=School 21/CN=nsylwa"

# START
RUN chmod u+x /home/srcs/start.sh
CMD /home/srcs/start.sh

EXPOSE 80 443 22
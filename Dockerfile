# The source image to start with
FROM alpine:3.14

# Your contact info
MAINTAINER wiggal ;ludwig.sporrer@gmx.de

ENV CONTAINER_TIMEZONE="Europe/Berlin"

COPY GEN24_Ladesteuerung-main/ /home/GEN24

RUN apk add --update-cache \
    php \
    php-json \
    apache2 \
    php-apache2 \
    php-sqlite3 \
    tzdata \
    python3=~3.9 \
    py-pip \
    bash \
    file \
    py3-numpy \
  && pip install pyModbusTCP==v0.1.10 \
  && pip install pickledb \
  && pip install pytz \
  && pip install xmltodict \
  && pip install requests \
  && pip install ping3 \
  && rm -rf /var/cache/apk/* \
&& cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
&& sed -i -e 's#/var/www/localhost/htdocs#/home/GEN24/html#' /etc/apache2/httpd.conf \
&& echo 'ServerName 127.0.0.1' >> /etc/apache2/httpd.conf \
&& echo "# DO NOT EDIT THIS FILE - edit the master and reinstall." >>/var/tmp/www-data \
&& echo "# (/tmp/crontab.uQN1v1/crontab installed on Wed May 31 19:23:33 2023)" >>/var/tmp/www-data \
&& echo "# (Cron version -- $Id: crontab.c,v 2.13 1994/01/17 03:20:37 vixie Exp $)" >>/var/tmp/www-data \
&& echo "# Edit this file to introduce tasks to be run by cron." >>/var/tmp/www-data \
&& echo "#\n#" >>/var/tmp/www-data \
&& echo "# m h  dom mon dow   command" >>/var/tmp/www-data \
&& echo "#*/5 06-17 * * * /home/GEN24/start_PythonScript.sh SymoGen24Controller2.py schreiben" >>/var/tmp/www-data \
&& echo "#33 5,8,10,12,14,19 * * * /home/GEN24/start_PythonScript.sh WeatherDataProvider2.py" >>/var/tmp/www-data \
&& echo "#8 5,8,10,15,19 * * * /home/GEN24/start_PythonScript.sh Solarprognose_WeatherData.py" >>/var/tmp/www-data \
&& echo "#0 5,7,9,11,13 * * * /home/GEN24/start_PythonScript.sh Solcast_WeatherData.py" >>/var/tmp/www-data \
&& echo "### /home/GEN24/Crontab.log abräumen" >>/var/tmp/www-data \
&& echo "#0 5 * * 1 mv /home/GEN24/Crontab.log /home/GEN24/Crontab.log_weg" >>/var/tmp/www-data \
&& chmod +x /home/GEN24/start_* \
&& >> /home/GEN24/Crontab.log \
&& touch /var/log/cron.log

# Alle Befehle die Nach dem Imagestart ausgeführt werden müssen
CMD chown -R apache /home/GEN24/ && \
    /usr/sbin/httpd -k start && \
    crontab /var/tmp/www-data && \
    /usr/sbin/crond -f -d 0 && \
    tail -f /var/log/cron.log

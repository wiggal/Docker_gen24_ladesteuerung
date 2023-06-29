# Docker_gen24_ladesteuerung
Dockerfile und Beschreibung für das Dockerimage gen24_ladesteuerung

1.)

Vorgehensweise zum erstellen des Dockerimages

In einem Verzeichnis folgende Daten bereitstellen:

Datei: 

Dockerfile
Evtl. Crontabs anpassen

Verzeichnis (entpacktes Zipfile von GEN24_Ladesteuerung),
config.ini  durch eigene ersetzen und evtl. Anpassungen in html/config.php machen:

GEN24_Ladesteuerung-main/

docker built ... ausführen

2.)

Dockerimage von hub.docker.com/repository/docker/wiggal/gen24_ladesteuerung/
verwenden und config.ini im Container anpassen, oder über Webaufruf

3.)

docker-compose

mit der docker-compose.yml können folgende Dateien in das Image wiggal/gen24_ladesteuerung:0.9.0 gemappt werden <br>
wobei die lokalen Dateien vorhanden sein müsse:

        - ./CONFIGS/config.ini:/home/GEN24/config.ini
        - ./CONFIGS/config.php:/home/GEN24/html/config.php
        - ./CONFIGS/Crontab.log:/home/GEN24/Crontab.log
        - ./CONFIGS/crontab:/var/tmp/www-data

Dadurch kann die eigene Konfiguration einfach ins IMAGE geladen werden.

Mit folgendem Befehl kann ein Container erzeugt und gestartet werden:
docker-compose up -d

#######################################

Die Dateien  docker-compose.yml und Dockerfile bauen auf Linux ubuntu:22.04 auf.<br>
Das Image ist 685MB groß.

Die Dateien  docker-compose_alpine.yml und Dockerfile_alpine bauen auf Linux alpine:3.14 auf.<br>
Das Image ist 168MB klein ;-).

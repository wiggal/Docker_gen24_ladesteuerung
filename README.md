# Docker_gen24_ladesteuerung
Dockerfile und Beschreibung für das Dockerimage gen24_ladesteuerung_alpine

1.) Nur wenn man selber ein Image erstellen will.

Vorgehensweise zum Erstellen des Dockerimages 

In einem Verzeichnis folgende Daten bereitstellen:

Datei: 

Dockerfile
Evtl. Crontabs anpassen

Verzeichnis (entpacktes Zipfile von GEN24_Ladesteuerung),
config.ini  durch eigene ersetzen und evtl. Anpassungen in html/config.php machen:

GEN24_Ladesteuerung-main/

docker built ... ausführen

2.)

Dockerimage "latest" von hub.docker.com/repository/docker/wiggal/gen24_ladesteuerung_alpine
verwenden und config.ini im Container, oder über Webaufruf anpassen

3.)

docker-compose

mit der docker-compose.yml können folgende Dateien in das Image wiggal/gen24_ladesteuerung_alpine:latest gemappt werden,  
wobei die lokalen Dateien vorhanden sein müssen (PV_Daten.sqlite kann als leere Datei angelegt werden):  

**_NEU ab Version 0.12.0_**  
        - ./CONFIGS/Crontab.log:/home/GEN24/PV_Daten.sqlite  
**_ENDE NEU_**  

```
        - ./CONFIGS/config.ini:/home/GEN24/config.ini
        - ./CONFIGS/config.php:/home/GEN24/html/config.php
        - ./CONFIGS/Crontab.log:/home/GEN24/Crontab.log
        - ./CONFIGS/Crontab.log:/home/GEN24/PV_Daten.sqlite
        - ./CONFIGS/crontab:/var/tmp/www-data
```

Dadurch kann die eigene Konfiguration einfach ins IMAGE geladen werden.

Mit folgendem Befehl kann ein Container erzeugt und gestartet werden:  
`docker-compose up -d`

4.) [Ausführung im Synology-Docker siehe Beschreibung im Wiki](https://github.com/wiggal/Docker_gen24_ladesteuerung/wiki/Installation-Dockerimage-von-Gen24%E2%80%90Ladesteuerung-im-Synology%E2%80%90Docker)  

#######################################

Die Dateien  docker-compose.yml und Dockerfile bauen auf Linux alpine:3.14 auf.<br>
Das Image ist ca. 170 MB klein ;-).


# Docker_gen24_ladesteuerung  

### Dockerfiles und Beschreibung für folgende Dockerimages:  

gen24_ladesteuerung_php: Hier ist der in PHP eingebaute Webserver auf Port 2424 konfiguriert.  


### 1.) Nur wenn man selber ein Image erstellen will.

Vorgehensweise zum Erstellen des Dockerimages 

In einem Verzeichnis folgende Daten bereitstellen:

Dockerfile:  
Evtl. Crontabs anpassen

In Verzeichnis (entpacktes Zipfile von GEN24_Ladesteuerung) GEN24_Ladesteuerung-main:

Anlegen und anpassen der xy_priv.ini im Verzeichnis CONFIG.   
Anlegen und anpassen von html/config_priv.php.  

docker built ... ausführen

### 2.) docker-compose

mit der php_docker-compose.yml können folgende Dateien in das Image wiggal/gen24_ladesteuerung_php:latest gemappt werden,  
wobei die lokalen Dateien vorhanden sein müssen (PV_Daten.sqlite kann als leere Datei angelegt werden):  

**Ab Version 0.24.0 Prog_Steuerung.sqlite**

```
        - ./CONFIGS/CONFIG/default_priv.ini:/home/GEN24/CONFIG/default_priv.ini
        - ./CONFIGS/CONFIG/charge_priv.ini:/home/GEN24/CONFIG/charge_priv.ini
        - ./CONFIGS/CONFIG/weather_priv.ini:/home/GEN24/CONFIG/weather_priv.ini
        - ./CONFIGS/CONFIG/Prog_Steuerung.sqlite:/home/GEN24/CONFIG/Prog_Steuerung.sqlite
        - ./CONFIGS/config_priv.php:/home/GEN24/html/config_priv.php
        - ./CONFIGS/Crontab.log:/home/GEN24/Crontab.log
        - ./CONFIGS/PV_Daten.sqlite:/home/GEN24/PV_Daten.sqlite
        - ./CONFIGS/crontab:/var/tmp/www-data
```

Dadurch kann die eigene Konfiguration einfach ins IMAGE geladen werden.

Mit folgendem Befehl kann ein Container erzeugt und gestartet werden:  
`docker-compose up -d`

### 3.) [Ausführung im Synology-Docker siehe Beschreibung im Wiki](https://github.com/wiggal/Docker_gen24_ladesteuerung/wiki/Installation-Dockerimage-von-Gen24%E2%80%90Ladesteuerung-im-Synology%E2%80%90Docker)  

#######################################


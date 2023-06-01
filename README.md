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

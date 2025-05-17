# Utilise l'image Alpine Linux la plus récente comme base (image légère et rapide)
FROM alpine:latest

# Met à jour le gestionnaire de paquets et installe BusyBox avec httpd (busybox-extras)
RUN apk update && apk add --no-cache busybox-extras

# Crée un répertoire /www dans le conteneur pour stocker les fichiers du site
WORKDIR /www

# Copie tout le contenu du dossier local "html" dans le dossier /www du conteneur
COPY ./html /www

# Ouvre le port 80 pour permettre l'accès HTTP au serveur web
EXPOSE 80

# Démarre le serveur HTTP de BusyBox en mode premier plan (-f), sur le port 80, avec /www comme racine
CMD ["busybox-extras", "httpd", "-f", "-p", "80", "-h", "/www"]





#docker build -t site-statique-alpine .
#docker run -p 8080:80 myshop

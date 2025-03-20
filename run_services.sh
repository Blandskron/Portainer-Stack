#!/bin/bash

# Verificar si Docker está instalado
docker -v >/dev/null 2>&1 || { echo "Docker no está instalado. Instalalo primero."; exit 1; }

echo "Iniciando los servicios con Docker Compose..."
docker-compose up -d

# Verificar si los contenedores están corriendo
echo "Verificando contenedores en ejecución..."
docker ps

# Configurar las imágenes para que sean accesibles en la red interna
echo "Configurando acceso en la red..."
docker network create digitus_lan || echo "La red ya existe"
docker network connect digitus_lan portainer
docker network connect digitus_lan db_digitus
docker network connect digitus_lan service_user
docker network connect digitus_lan service_auth

echo "Todos los servicios han sido iniciados y configurados correctamente."

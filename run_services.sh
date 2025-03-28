#!/bin/bash

# Verificar si Docker está instalado
docker -v >/dev/null 2>&1 || { echo "Docker no está instalado. Instálalo primero."; exit 1; }

echo "Iniciando los servicios con Docker Compose..."
docker-compose up -d

# Verificar si los contenedores están corriendo
echo "Verificando contenedores en ejecución..."
docker ps

# Configurar las imágenes para que sean accesibles en la red interna
echo "Configurando acceso en la red..."
docker network create digitus_lan || echo "La red ya existe"
docker network connect digitus_lan portainer
docker network connect digitus_lan db_digitus_data
docker network connect digitus_lan digitus_elasticsearch
docker network connect digitus_lan digitus_service_zookeeper
docker network connect digitus_lan digitus_service_kafka
docker network connect digitus_lan digitus_kafka_ui
docker network connect digitus_lan digitus_repository
docker network connect digitus_lan digitus_service_user
docker network connect digitus_lan digitus_service_publish
docker network connect digitus_lan digitus_service_auth
docker network connect digitus_lan digitus_service_document_transfer
docker network connect digitus_lan digitus_service_log
docker network connect digitus_lan digitus_service_extract
docker network connect digitus_lan digitus_service_consumer

echo "Todos los servicios han sido iniciados y configurados correctamente."

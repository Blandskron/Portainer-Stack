Portainer:
http://localhost:9000

Base de Datos (PostgreSQL):
No tiene una interfaz web directamente accesible, pero puedes conectarte al puerto 50000 para interactuar con la base de datos.

pgAdmin (Herramienta de Administración de Base de Datos):
http://localhost:50003

Traefik (Proxy de Entrada):
http://localhost:8080 (Panel de administración de Traefik)

Elasticsearch:
http://localhost:4624 (Interfaz RESTful de Elasticsearch)

Kibana:
http://localhost:4626 (Interfaz de Kibana)

Zookeeper:
No tiene una interfaz web directamente accesible, pero puedes interactuar con el servicio Zookeeper en el puerto 4616.

Kafka:
No tiene una interfaz web directamente accesible, pero puedes interactuar con Kafka en los puertos 4617 (9092) o 4618 (9093).

Kafka UI:
http://localhost:4619

Repository (Tomcat):
http://localhost:4610

User Service:
http://localhost:50001

Publish Service:
http://localhost:50008

Extract Service:
http://localhost:50009

Log Service:
http://localhost:50006

Auth Service:
http://localhost:50002

Document Transfer Service:
http://localhost:50004

Document Service:
http://localhost:50005

Consumer Service:
http://localhost:50007

docker build -t blandskron/extract:v1.0 .
docker push blandskron/extract:v1.0

VITE_MEDIA_URL=http://172.16.22.113:4610/core
VITE_API_AUTH_URL=http://172.178.114.51:50002/api/auth
VITE_API_DOCUMENT_URL=http://172.178.114.51:50005/api/documents
VITE_API_DOCUMENT_TRANSFER_URL=http://172.178.114.51:50004/api/documents
VITE_API_USER_URL=http://172.178.114.51:50001/api/users
VITE_API_PUBLISH_URL=http://172.16.22.113:4620/api/events/publish

./run_services.sh

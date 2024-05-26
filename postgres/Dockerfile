# Usar la imagen oficial de PostgreSQL versión 15
FROM postgres:15

# Establecer variables de entorno
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB postgres

# Opcional: Agregar scripts de inicialización
COPY ./src/db/ /docker-entrypoint-initdb.d/
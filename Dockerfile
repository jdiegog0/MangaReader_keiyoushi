# Usamos la imagen oficial
FROM ghcr.io/suwayomi/suwayomi-server:latest

# Exponer el puerto de Render
EXPOSE 10000

# Variables de entorno críticas
ENV SUWAYOMI_SERVER_PORT=10000 \
    SUWAYOMI_SERVER_IP=0.0.0.0 \
    SUWAYOMI_SERVER_DATA_PRV_DIR=/home/suwayomi/.local/share/SuwayomiServer \
    # EL CAMBIO CLAVE: Limitamos la memoria de Java
    # -Xmx400m: Define la memoria máxima que la JVM puede usar (heap space).
    # -Xms128m: Define la memoria inicial que reserva al arrancar.
    JAVA_OPTS="-Xmx400m -Xms128m"

# Creamos y damos permisos de usuario no raíz
USER root
RUN mkdir -p /home/suwayomi/.local/share/SuwayomiServer && \
    chmod -R 777 /home/suwayomi
USER suwayomi

# Usar el entrypoint original de la imagen
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
# Y el comando de inicio oficial
CMD ["/app/suwayomi-server"]

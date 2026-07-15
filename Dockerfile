# Usamos la imagen oficial de Suwayomi Server
FROM ghcr.io/suwayomi/suwayomi-server:latest

# Exponer el puerto requerido por Hugging Face Spaces
EXPOSE 7860

# Definir variables de entorno para Suwayomi
ENV SUWAYOMI_SERVER_PORT=7860 \
    SUWAYOMI_SERVER_IP=0.0.0.0 \
    SUWAYOMI_SERVER_DATA_PRV_DIR=/home/suwayomi/.local/share/SuwayomiServer

# Permisos para Hugging Face
RUN mkdir -p /home/suwayomi/.local/share/SuwayomiServer && \
    chmod -R 777 /home/suwayomi

CMD ["java", "-jar", "/app/SuwayomiServer.jar"]
# Utiliza una imagen base que tenga Python instalado
FROM python:3.9

# Establece el directorio de trabajo en la aplicación
WORKDIR /app

# Copia el código Python a la imagen
COPY get_bitcoin_price.py /app/

# Instala las dependencias (en este caso, solo requests)
RUN pip install requests

# Define el comando por defecto para ejecutar cuando se inicie el contenedor
CMD ["python", "./get_bitcoin_price.py"]

#Imagen base
FROM python:3.10-slim

#Crear los directorios de trabajo
WORKDIR /app

#copiar las dependencias
COPY requirements.txt .
RUN pip install -r requirements.txt

#copiar el codigo
COPY . .

#exponer el puerto
EXPOSE 5000

#Comando de arranque
CMD ["python", "app.py"]
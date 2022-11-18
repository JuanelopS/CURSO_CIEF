# Imagen base del sistema operativo
FROM node:19-slim


# Directorio de trabajo de la aplicación
WORKDIR /app

COPY package*.json ./

RUN npm install 

# equivale a -> COPY /src/ /app/
COPY . .

# puerto que usa nuestra aplicación
EXPOSE 4000 

CMD ["npm", "start"]


# build -> docker build -t node-docker . 

# run -> (winpty) docker run -it -p 3000:4000 node-docker:v2

# ! docker ps -a 

# para borrar un contenedor no puede estar en uso
# ! docker rm <id-contenedor>

# funcionamiento en segundo plano -> cambio de -it por -d
# ! docker run -d -p 3000:4000 node-docker:v2

# parar servicio
# ! docker stop <id> -t <tiempo>

# mysql
# ! docker run -p 3307:3306 --name mysql-cine -e MYSQL_ROOT_PASSWORD=1234 -it mysql:8

# docker-compose --version
# docker swarn
# kubernetes










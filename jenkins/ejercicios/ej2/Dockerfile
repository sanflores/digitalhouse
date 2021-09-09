FROM node:14

# Creamos directorio para la aplicación
WORKDIR /usr/src/app

# Instalamos dependencias
COPY package*.json ./

RUN npm install

# Copiamos los sources de la aplicación
COPY . .

# Ejecutamos la aplicación
EXPOSE 8080
CMD [ "node", "index.js" ]

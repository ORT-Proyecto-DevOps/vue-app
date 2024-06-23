# Usar una imagen base oficial de Node.js
FROM node:18

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el archivo de definición de dependencias
COPY package.json pnpm-lock.yaml ./

# Instalar pnpm globalmente
RUN npm install -g pnpm

# Instalar las dependencias del proyecto
RUN pnpm install

# Copiar el resto del código de la aplicación al contenedor
COPY . .

# Compilar la aplicación
RUN pnpm run build

# Instalar 'serve' para servir archivos estáticos
RUN npm install -g serve

# Exponer el puerto en el que la aplicación se ejecutará
EXPOSE 5000

# Comando para ejecutar la aplicación
CMD ["serve", "-s", "dist", "-l", "5000"]

# ---------- Build stage ----------
FROM node:20-alpine AS build
WORKDIR /app

# Instala deps primero para aprovechar cache
COPY package*.json ./
RUN npm ci

# Copia el resto y construye
COPY . .
ARG BUILD_DIR=dist
ENV BUILD_DIR=${BUILD_DIR}

RUN npm run build

# ---------- Runtime stage ----------
FROM nginx:1.27-alpine

# Nginx config para SPA (React Router) + caching
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Copia el build al docroot de Nginx
ARG BUILD_DIR=dist
COPY --from=build /app/${BUILD_DIR} /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

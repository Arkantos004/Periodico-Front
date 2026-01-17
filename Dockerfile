# ---------- Build stage ----------
FROM node:20-alpine AS build
WORKDIR /app

# Habilita corepack (incluye pnpm)
RUN corepack enable

# Copia manifests primero para cache
COPY package.json pnpm-lock.yaml ./

# Instala deps (frozen lockfile = reproducible)
RUN pnpm install --frozen-lockfile

# Copia el resto y build
COPY . .

ARG BUILD_DIR=dist
RUN pnpm run build

# ---------- Runtime stage ----------
FROM nginx:1.27-alpine
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

ARG BUILD_DIR=dist
COPY --from=build /app/${BUILD_DIR} /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

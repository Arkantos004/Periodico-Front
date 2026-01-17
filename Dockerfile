# ---------- Build stage ----------
FROM node:20-alpine AS build
WORKDIR /app

RUN corepack enable

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

COPY . .
RUN pnpm run build

# Detecta carpeta de salida (dist o build) y la copia a /out
RUN if [ -d dist ]; then cp -r dist /out; \
    elif [ -d build ]; then cp -r build /out; \
    else echo "No dist/ or build/ found after build" && ls -la && exit 1; fi

# ---------- Runtime stage ----------
FROM nginx:1.27-alpine
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=build /out /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

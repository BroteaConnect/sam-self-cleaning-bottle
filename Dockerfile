# syntax=docker/dockerfile:1
# Multi-stage: build the static Astro site, serve dist/ with nginx.
# Coolify must use build_pack=dockerfile — nixpacks has no start command
# for static sites and crash-loops (503).
FROM node:22-alpine AS build
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci || npm install
COPY . .
# PUBLIC_* vars are inlined into the bundle at build time. The composer
# wires one ARG/ENV pair per feature right below this anchor; the deploy
# skill supplies the values as Coolify build args.
# brotea:build-args
ARG PUBLIC_BUILD_COMMIT
ENV PUBLIC_BUILD_COMMIT=$PUBLIC_BUILD_COMMIT
ARG PUBLIC_REQUIREMENTS_ENDPOINT=""
ENV PUBLIC_REQUIREMENTS_ENDPOINT=$PUBLIC_REQUIREMENTS_ENDPOINT
RUN npm run build
# The form must never ship dead again: a landing build without a real
# endpoint in the HTML is a broken artifact, not a warning.
RUN grep -q 'data-endpoint="https://[^"]*"' dist/index.html

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

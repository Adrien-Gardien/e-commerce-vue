FROM node:18.19.0-alpine AS base
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

FROM base AS build-production
ENV NODE_ENV=production

RUN ls -al vite.config.js || { echo "vite.config.js est manquant !" && exit 1; }


RUN npm run build

FROM node:18.19.0-alpine AS production
WORKDIR /app
ENV NODE_ENV=production

COPY package*.json ./
RUN npm install --omit=dev

COPY --from=build-production /app/dist ./dist
COPY --from=build-production /app/server.cjs ./server.cjs

EXPOSE 8080

CMD ["npm", "start"]
# Étape 1 : BASe commune
FROM node:18.19.0-alpine AS base
WORKDIR /app

# Copie des fichiers nécessaires pour installer les dépendances
COPY package*.json ./
RUN npm install

# Copie des fichiers, y compris vite.config.js
COPY . .

# Étape 2 : Build pour la production
FROM base AS build-production
ENV NODE_ENV=production

# Debug : Vérifiez que vite.config.js est présent
RUN ls -al vite.config.js || { echo "vite.config.js est manquant !" && exit 1; }

# Exécutez le build
RUN npm run build

# Étape finale : Serveur de production
FROM node:18.19.0-alpine AS production
WORKDIR /app
ENV NODE_ENV=production

# Installation des dépendances en mode production uniquement
COPY package*.json ./
RUN npm install --omit=dev

# Copie des fichiers générés pour la production
COPY --from=build-production /app/dist ./dist
COPY --from=build-production /app/server.cjs ./server.cjs

# Expose le port 8080
EXPOSE 8080

# Commande pour démarrer l'application
CMD ["npm", "start"]

FROM node:18-alpine AS development

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]

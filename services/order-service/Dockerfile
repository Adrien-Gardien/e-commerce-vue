FROM node:18-slim

WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY . .

EXPOSE 3002
CMD ["npm", "start"]

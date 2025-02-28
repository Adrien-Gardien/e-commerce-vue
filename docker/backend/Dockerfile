FROM node:18 AS builder

ARG SERVICE_NAME

WORKDIR /app

COPY services/${SERVICE_NAME} /app/

RUN npm ci --only=production

FROM node:18-slim

WORKDIR /app

COPY --from=builder /app /app

RUN useradd -m nodeuser && chown -R nodeuser /app
USER nodeuser

ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

CMD ["node", "src/app.js"]

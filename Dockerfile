FROM node:18-alpine AS base
WORKDIR /app
COPY package.json .
RUN npm install --production

FROM node:18-alpine AS final
WORKDIR /app
COPY --from=base /app/node_modules ./node_modules
COPY . .
EXPOSE 3000
CMD ["node", "app.js"]

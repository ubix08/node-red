FROM node:20-bookworm-slim
RUN apt-get update && apt-get install -y git && apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY . .
EXPOSE 1880
ENV NODE_ENV=production NODE_RED_LOG_LEVEL=warn PORT=1880
CMD ["node", "packages/node_modules/node-red/red.js", "--settings", "packages/node_modules/node-red/settings.js"]

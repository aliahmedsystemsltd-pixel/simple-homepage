FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy dependency manifests first (cache optimization)
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy application source
COPY . .

# Document port
EXPOSE 3000

# Start command
CMD ["node", "index.js"]

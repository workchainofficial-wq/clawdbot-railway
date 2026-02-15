FROM node:22-alpine

WORKDIR /app

# Install Clawdbot globally
RUN npm install -g clawdbot@latest

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Expose port (Railway will set PORT env variable)
EXPOSE 18789

# Start Clawdbot gateway
CMD ["clawdbot", "gateway", "start"]

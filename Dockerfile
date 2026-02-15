FROM node:22-slim

WORKDIR /app

# Install Clawdbot
RUN npm install -g clawdbot@latest

# Copy any config if needed
COPY . .

# Expose port
EXPOSE 18789

# Start Clawdbot gateway
CMD ["clawdbot", "gateway", "start"]

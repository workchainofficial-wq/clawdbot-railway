FROM node:22-slim

WORKDIR /app

# Install Clawdbot
RUN npm install -g clawdbot@latest

# Expose Render's default port
EXPOSE 10000

# Start command
CMD ["clawdbot", "gateway", "start"]

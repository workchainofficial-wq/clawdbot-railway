FROM node:22-bullseye-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Clawdbot globally
RUN npm install -g clawdbot@latest

# Create config directory
RUN mkdir -p /root/.clawdbot

# Expose port
ENV PORT=18789
EXPOSE 18789

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:${PORT}/health || exit 1

# Start Clawdbot
CMD ["clawdbot", "gateway", "start"]

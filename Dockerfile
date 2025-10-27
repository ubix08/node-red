# Use official Node.js 20 slim image as base
FROM node:20-bookworm-slim

# Install git (required for some npm dependencies)
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy package files first (for better Docker layer caching)
COPY package*.json ./

# Install production dependencies only
RUN npm install --production --no-optional

# Copy application files

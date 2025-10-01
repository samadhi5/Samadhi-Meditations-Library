FROM ghost:5-alpine

# Set working directory
WORKDIR /var/lib/ghost

# Copy custom configuration if you have any
# COPY config.production.json ./config.production.json

# Expose port
EXPOSE 2368

# The base image already has the correct CMD

# Use Alpine 3.21 as the base image
FROM alpine:3.19.7

USER root

# Update and install basic tools (optional, depending on your needs)
RUN apk update && apk add --no-cache bash curl

# Set the working directory
WORKDIR /app

# Copy files (if needed)
# COPY . .

# Default command (optional)
CMD ["sh"]

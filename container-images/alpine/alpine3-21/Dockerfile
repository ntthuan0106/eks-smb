# Use Alpine 3.21 as the base image
FROM alpine:3.21.3

USER root

# Update and install basic tools (optional, depending on your needs)
RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add bash samba shadow tini tzdata && \
    addgroup -S smb && \
    adduser -S -D -H -h /tmp -s /sbin/nologin -G smb -g 'Samba User' smbuser

# Set the working directory
WORKDIR /app

# Copy files (if needed)
# COPY . .

# Default command (optional)
CMD ["sh"]

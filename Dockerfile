FROM alpine:latest

WORKDIR /app

# Install curl
RUN apk add --no-cache curl

# Download PocketBase binary
RUN curl -L -o pocketbase.zip https://github.com/pocketbase/pocketbase/releases/latest/download/pocketbase_0.24.6_linux_amd64.zip && \
    unzip pocketbase.zip && \
    chmod +x pocketbase && \
    rm pocketbase.zip

# Copy any existing data (optional)
COPY pb_data /app/pb_data

EXPOSE 8090

CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090"]

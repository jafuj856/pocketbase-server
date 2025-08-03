FROM alpine:latest

WORKDIR /app

# install curl and unzip so we can fetch and unpack PocketBase
RUN apk add --no-cache curl unzip

# download the current stable PocketBase Linux amd64 binary and unpack it
RUN curl -L -o pocketbase.zip https://github.com/pocketbase/pocketbase/releases/download/v0.29.1/pocketbase_0.29.1_linux_amd64.zip && \
    unzip pocketbase.zip && \
    chmod +x pocketbase && \
    rm pocketbase.zip

# persist data directory (you have .gitkeep so it exists in git)
COPY pb_data /app/pb_data

EXPOSE 8090

CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8090"]

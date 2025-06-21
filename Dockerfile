FROM rust:1.87-alpine AS builder

# Install musl-dev for static linking
RUN apk add --no-cache musl-dev

WORKDIR /app
COPY Cargo.toml ./
COPY src/ ./src/

# Build the application for musl target
RUN cargo build --release --target x86_64-unknown-linux-musl

# Runtime stage
FROM alpine:latest

WORKDIR /app

# Copy the binary from builder stage
COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/ha-discord-bot-rs .

# Run the bot
CMD ["./ha-discord-bot-rs"]
FROM rust:1.87 AS builder

WORKDIR /app
COPY Cargo.toml ./
COPY src/ ./src/

# Build the application
RUN cargo build --release

# Runtime stage
FROM alpine:latest

WORKDIR /app

# Copy the binary from builder stage
COPY --from=builder /app/target/release/ha-discord-bot-rs .

# Run the bot
CMD ["./ha-discord-bot-rs"]
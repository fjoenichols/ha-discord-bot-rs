
FROM rust:1.87-alpine AS builder

RUN apk add --no-cache musl-dev

WORKDIR /app
COPY Cargo.toml ./
COPY src/ ./src/

RUN cargo build --release --target x86_64-unknown-linux-musl

# Runtime stage - using scratch for minimal image
FROM scratch

COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/ha-discord-bot-rs /ha-discord-bot-rs
CMD ["/ha-discord-bot-rs"]
FROM rust:1.43.1 as builder

RUN apt update && apt-get install -y musl-tools

COPY src src
COPY Cargo.toml .

RUN rustup target add x86_64-unknown-linux-musl
RUN cargo build --release --target x86_64-unknown-linux-musl
RUN ls target/x86_64-unknown-linux-musl/release

FROM alpine:latest

COPY --from=builder target/x86_64-unknown-linux-musl/release/hello-app-rust ./hello-app-rust

EXPOSE 8080

# Run the application
CMD ["./hello-app-rust"]
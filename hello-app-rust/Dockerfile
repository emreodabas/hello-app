FROM rust:1.43.1

RUN mkdir /usr/src/hello-app-rust
WORKDIR /usr/src/hello-app-rust

COPY src src
COPY Cargo.toml .

RUN cargo build --release

EXPOSE 8080

# Run the application
CMD ["target/release/hello-app-rust"]
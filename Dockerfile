# generate code docker file muti stage for rust
# build stage
FROM rust:1.82-slim AS builder
WORKDIR /usr/src/app
COPY . .


RUN cargo check
RUN cargo test
RUN cargo build --release

# final stage
FROM rust:alpine AS runtime
WORKDIR /app
COPY --from=builder /usr/src/app/target/release/ ./app

# ENTRYPOINT [ "./" ]
CMD ["github-action-workshop"]

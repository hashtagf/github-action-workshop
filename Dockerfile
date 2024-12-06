# generate code docker file muti stage for rust
# build stage
FROM rust:alpine3.20 AS builder
WORKDIR /usr/src/app
COPY . .

RUN apk add musl-dev
# RUN cargo check
# RUN cargo test
RUN cargo build --release

# final stage
FROM rust:alpine3.20 AS runtime
WORKDIR /app
COPY --from=builder /usr/src/app/target/release/github-action-workshop .
RUN apk add libgcc

# ENTRYPOINT [ "./" ]
EXPOSE 8080
ENTRYPOINT ["/app/github-action-workshop"]

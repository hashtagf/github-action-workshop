# Githubaction workflows

## Run Rust

```bash
cargo run
```

## Build Rust for test

```bash
cargo build --release
```

## Docker build

```bash
docker build . -t rust-demo
```

## Docker run

```bash
docker run --name test-rust -p 8080:8080 rust-demo -d
```

## View Docker for chekc already run

```bash
docker ps -a
```

# Next step

## Github token

### GIT PAT TOKEN

- set personal accesstoken in github action secret

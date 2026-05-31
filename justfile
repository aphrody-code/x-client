# Task runner for standalone x-client workspace

default:
    @just --list

# Build Rust library and CLI
build-rust:
    cargo build --release

# Run Rust unit/integration tests
test-rust:
    cargo test

# Run Rust lints
lint-rust:
    cargo clippy --all-targets -- -D warnings

# Format Rust code
fmt-rust:
    cargo fmt --all

# Install Bun dependencies
install-ts:
    cd ts && bun install

# Run TypeScript tests
test-ts:
    cd ts && bun test

# Run TypeScript lints
lint-ts:
    cd ts && bun run typecheck

# Build both components
build: build-rust install-ts
    cd ts && bun run build

# Run all tests
test: test-rust test-ts

# Run all lints
lint: lint-rust lint-ts

before_commit:
  cargo fmt --check
  cargo clippy --release --all-targets -- -D warnings
  cargo clippy --all-targets -- -D warnings
  cargo build --release --all-targets
  cargo build --all-targets
  cargo clippy --release --all-targets --no-default-features -- -D warnings
  cargo test
  cargo test --release
  cargo test --doc
  cargo test --release --no-default-features
  RUSTDOCFLAGS="-D warnings" cargo doc --all-features

ethi_bench:
  cargo build --release --all-targets
  cd ../Yaml-rust && cargo build --release --all-targets
  cd ../serde-yaml/ && cargo build --release --all-targets
  cd ../libfyaml/build && ninja
  cargo bench_compare run_bench

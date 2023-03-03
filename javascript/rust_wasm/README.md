# Build tools for rust wasm player plugins.

## Development

This rules uses `crate_universe` [rules_rust](https://github.com/bazelbuild/rules_rust/blob/main/wasm_bindgen/DEVELOPMENT.md) to setup `wasm_bindgen-cli` in order to build and bundle your rust plugin into a NPM package target.

To bootstrap the generated `/3rdparty/crates` directory:
1. Comment the `rust_binary` target in `/3rdparty/BUILD.wasm-bindgen-cli.bzl` **and** the corresponding alias
2. Invoke the `crates_vendor` target: `bazel run //javascript/rust_wasm/3rdparty:crates_vendor -- --repin`
3. Uncomment the code

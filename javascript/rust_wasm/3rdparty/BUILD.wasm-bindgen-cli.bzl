load("@rules_rust//rust:defs.bzl", "rust_binary")
load("@rules_player//javascript/rust_wasm:repositories.bzl", "WASM_BINDGEN_VERSION")
load("@rules_player//javascript/rust_wasm/3rdparty/crates:defs.bzl", "aliases", "all_crate_deps")

package(default_visibility = ["//visibility:public"])

exports_files([
    "Cargo.toml",
])

# TODO: Comment on bootstrapping
rust_binary(
    name = "wasm-bindgen-cli",
    srcs = glob(["**/*.rs"]),
    aliases = aliases(),
    crate_features = [
    ],
    crate_root = "src/bin/wasm-bindgen.rs",
    data = [],
    edition = "2021",
    proc_macro_deps = all_crate_deps(proc_macro = True),
    rustc_flags = [
        # Don't produce warnings for this crate
        "--cap-lints=allow",
    ],
    version = WASM_BINDGEN_VERSION,
    deps = all_crate_deps(),
)

alias(
    name = "rust_wasm_bindgen_cli",
    actual = ":wasm-bindgen-cli",
    tags = ["manual"],
)

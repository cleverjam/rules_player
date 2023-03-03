load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//internal:maybe.bzl", "maybe")
load("//javascript/rust_wasm:repositories.bzl", "WASM_BINDGEN_VERSION")

def javascript():
    maybe(
        http_archive,
        name = "build_bazel_rules_nodejs",
        sha256 = "3aa6296f453ddc784e1377e0811a59e1e6807da364f44b27856e34f5042043fe",
        urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/4.4.2/rules_nodejs-4.4.2.tar.gz"],
    )
    maybe(
        http_archive,
        name = "rules_rust",
        sha256 = "2466e5b2514772e84f9009010797b9cd4b51c1e6445bbd5b5e24848d90e6fb2e",
        urls = ["https://github.com/bazelbuild/rules_rust/releases/download/0.18.0/rules_rust-v0.18.0.tar.gz"],
    )
    maybe(
        http_archive,
        name = "rust_wasm_bindgen_cli",
        sha256 = "5a0e951a61574d4ba2d9d2705cc6b7cd8d67aefeb982bf2a60a9c7b05bef5682",
        urls = ["https://crates.io/api/v1/crates/wasm-bindgen-cli/{}/download".format(WASM_BINDGEN_VERSION)],
        type = "tar.gz",
        strip_prefix = "wasm-bindgen-cli-{}".format(WASM_BINDGEN_VERSION),
        build_file = Label("//javascript/rust_wasm/3rdparty:BUILD.wasm-bindgen-cli.bzl"),
    )

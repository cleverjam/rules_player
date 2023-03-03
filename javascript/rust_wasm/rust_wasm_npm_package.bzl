def _rust_wasm_npm_package(ctx):
    toolchain = ctx.toolchains[Label("//wasm_bindgen:wasm_bindgen_toolchain")]
    bindgen_bin = toolchain.bindgen
    print("analyzing", ctx.label)

rust_wasm_npm_package = rule(
    implementation = _rust_wasm_package,
    toolchains = ["@rules_rust//wasm_bindgen:toolchain_type"],
)


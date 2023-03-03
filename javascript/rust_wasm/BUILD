load("@bazel_skylib//:bzl_library.bzl", "bzl_library")

package(default_visibility = ["//visibility:public"])

toolchain_type(
    name = "toolchain_type",
)

bzl_library(
    name = "bzl_lib",
    srcs = glob(["**/*.bzl"]),
    deps = [
        "//javascript/rust_wasm/3rdparty:bzl_lib",
    ],
)

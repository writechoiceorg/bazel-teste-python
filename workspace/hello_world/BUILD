load("@bazel_skylib//:bzl_library.bzl", "bzl_library")

# hello_world/BUILD

load("@rules_python//python:defs.bzl", "py_binary", "py_library", "py_test")

# Este target executará a função say_hello
py_binary(
    name = "hello",
    srcs = ["hello.py"],
    main = "hello.py",
)

# Este target executará a função say_goodbye
py_binary(
    name = "goodbye",
    srcs = ["hello.py"],
    main = "hello.py",
)

bzl_library(
    name = "package_aspect",
    srcs = ["package_aspect.bzl"],
    visibility = ["//visibility:public"],
)

py_library(
    name = "hello_world",
    srcs = [
        "__init__.py",
        "hello.py",
        "run_goodbye.py",
        "run_hello.py",
    ],
    visibility = ["//:__subpackages__"],
)

py_test(
    name = "hello_test",
    srcs = ["hello_test.py"],
    deps = [":hello_world"],
)

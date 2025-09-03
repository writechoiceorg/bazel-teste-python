# hello_world/BUILD

load("@rules_python//python:defs.bzl", "py_library", "py_test")

py_library(
    name = "hello_lib",
    srcs = ["hello.py", "__init__.py"],
    imports = ["."],
)

py_test(
    name = "hello_test",
    srcs = ["hello_test.py"],
    deps = [":hello_lib"],
)
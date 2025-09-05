load("@bazel_skylib//:bzl_library.bzl", "bzl_library")

# hello_world/BUILD

load("@rules_python//python:defs.bzl", "py_binary", "py_library", "py_test")

genrule(
    name = "print_build_message",
    outs = ["build_message.txt"],
    cmd = "echo '>>> Building ... <<<' > $@",
)

# Este target executará a função say_hello
py_binary(
    name = "run_hello",
    srcs = ["run_hello.py"],
    deps = [":hello_world"],
)

# Este target executará a função say_goodbye
py_binary(
    name = "run_goodbye",
    srcs = ["run_goodbye.py"],
    deps = [":hello_world"],
)

py_binary(
    name = "parse_functions",
    srcs = ["parse_functions.py"],
)

py_binary(
    name = "aggregate_docs",
    srcs = ["aggregate_docs.py"],
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
    ],
    visibility = ["//:__subpackages__"],
)

py_test(
    name = "hello_test",
    srcs = ["hello_test.py"],
    deps = [":hello_world"],
)

load("//hello_world:aspects.bzl", "doc_aggregator_rule")

# Regra para agregar a documentação gerada pelo aspecto
doc_aggregator_rule(
    name = "docs",
    deps = [":hello_world"],
)
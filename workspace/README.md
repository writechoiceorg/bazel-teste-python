# Bazel Python Test Project

This is a simple Python project that uses Bazel as a build system.

## Structure

- `hello_world/`: Contains the Python source code.
  - `hello.py`: Defines the `say_hello` and `say_goodbye` functions.
  - `run_hello.py`: A script that prints the output of `say_hello`.
  - `run_goodbye.py`: A script that prints the output of `say_goodbye`.
  - `hello_test.py`: Contains unit tests for the functions in `hello.py`.
- `BUILD`: The Bazel build file for the `hello_world` package.
- `MODULE.bazel`: The Bazel module file.

## How to use

### Build

To build the project, run the following command:

```bash
bazel build //...
```

### Run

To run the `run_hello` script, use the following command:

```bash
bazel run //hello_world:run_hello
```

To run the `run_goodbye` script, use the following command:

```bash
bazel run //hello_world:run_goodbye
```

### Test

To run the tests, use the following command:

```bash
bazel test //...
```

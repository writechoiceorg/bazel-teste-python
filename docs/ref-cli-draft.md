# Aspect CLI Command Reference

This page provides a complete reference for all available commands and flags for the Aspect CLI.

The Aspect CLI is a complement for Bazel that provides a streamlined developer experience by offering additional commands and features.

## Usage

Use the following syntax to run a command:

```bash
aspect [command] [flags] [arguments]
```

To get more information about a specific command, use the `--help` flag:

```bash
aspect [command] --help
```

-----

## Commands

The Aspect CLI organizes its commands into the following categories.

### Common Bazel Commands

These commands are a core part of the Bazel toolset and are commonly used for building and testing.

| Command | Description |
| :--- | :--- |
| `build` | Builds the specified targets. |
| `cquery` | Queries the dependency graph, respecting configuration flags. |
| `run` | Builds a single target and runs it with the provided arguments. |
| `test` | Builds the specified targets and runs all test targets among them. |
| `version` | Prints the versions of the Aspect CLI and Bazel. |

### Aspect CLI-only Commands

These commands are specific to the Aspect CLI and extend the functionality of a standard Bazel workflow.

| Command | Description |
| :--- | :--- |
| `configure` | Automatically configures Bazel by updating `BUILD` files. |
| `docs` | Opens documentation in your web browser. |
| `init` | Creates a new Bazel workspace. |
| `lint` | Runs configured linters over the dependency graph. |
| `outputs` | Prints paths to declared output files. |
| `print` | Prints syntax elements from `BUILD` files. |

### Other Bazel Built-in Commands

The Aspect CLI also supports many other standard Bazel commands.

| Command | Description |
| :--- | :--- |
| `analyze-profile` | Analyzes build profile data. |
| `aquery` | Queries the action graph. |
| `canonicalize-flags` | Presents a list of Bazel options in a canonical form. |
| `clean` | Removes the output tree. |
| `config` | Displays details of configurations. |
| `coverage` | Same as `test`, but also generates a code coverage report. |
| `fetch` | Fetches external repositories that are prerequisites to the targets. |
| `info` | Displays runtime information about the Bazel server. |
| `license` | Prints the license of this software. |
| `mod` | Provides tools for working with the bzlmod external dependency graph. |
| `query` | Queries the dependency graph, ignoring configuration flags. |
| `shutdown` | Stops the Bazel server. |

### Additional Commands

| Command | Description |
| :--- | :--- |
| `completion` | Generates the autocompletion script for the specified shell. |
| `explain` | Compares two Bazel execution logs to detect non-hermetic build issues. |
| `help` | Displays help information. |

:::note
**Custom Commands from Plugins**

The Aspect CLI supports custom commands provided by plugins. The commands and their descriptions are not included in this reference as they depend on your specific plugin configuration.
:::

-----

## Flags

You can use flags with any Aspect CLI command to modify its behavior.

| Flag | Description | Default Value |
| :--- | :--- | :--- |
| `--aspect:config` | Specifies a user-defined Aspect CLI configuration file. Using `/dev/null` ignores all subsequent `--aspect:config` flags. | |
| `--aspect:hints` | Enables or disables hints if they are configured. | `true` |
| `--aspect:interactive` | Enables or disables interactive mode, such as prompts for user input. | `true` |
| `-h`, `--help` | Displays help for the `aspect` command. | |
| `-v`, `--version` | Displays the version for the `aspect` command. | |

<!-- BEGIN:AVATAR -->
![Avatar](avatar.jpg)
<!-- END:AVATAR -->

<!-- BEGIN:BADGES -->
[![Build Status](https://github.com/cliffano/generator-generator/workflows/CI/badge.svg)](https://github.com/cliffano/generator-generator/actions?query=workflow%3ACI)
[![Code Scanning Status](https://github.com/cliffano/generator-generator/workflows/CodeQL/badge.svg)](https://github.com/cliffano/generator-generator/actions?query=workflow%3ACodeQL)
[![Security Status](https://snyk.io/test/github/cliffano/generator-generator/badge.svg)](https://snyk.io/test/github/cliffano/generator-generator)
<!-- END:BADGES -->

# Generator-Generator

Generator-Generator is a code generator for code generators.

It provides the following component:

| Component | Description |
|-----------|-------------|
| component-generator | Generate a generator project to generate more code. |

## Usage

Generate code generator project:

```shell
make generate-component-generator
```

This component will prompt you the following inputs:

| Prompt | Description |
|--------|-------------|
| Project ID | Used for package names and project repo name. |
| Project Name | Used in documentation or comments. |
| Project Description | Used in documentation or comments. |
| Component Name | Used as the name of the first Plop component in the generated generator. |
| Author Name | The name of the project author. |
| Author Email | The email of the project author. |
| Author URL | The author's website URL. |
| GitHub ID | The GitHub ID of the project repo. |
| GitHub Repository | The GitHub repository name. |
| GitHub Actions token prefix | Prefix for the GitHub token secret used in GitHub Actions workflows. |

Move to the generated project directory:

```shell
cd stage/<component>/
```

## Usage With Config File

The component also has a `-with-config` target that skips the interactive prompts by reading the inputs from a Generatoo YAML config file. See [examples/](examples/) for a sample config file.

Pass the config file path via the `GENERATOR_CONFIG` variable, it defaults to `generatoo.yml`:

```shell
make generate-component-generator-with-config GENERATOR_CONFIG=path/to/generatoo.yml
```

## Colophon

<!-- BEGIN:DEVELOPERS_GUIDE -->
[Developer's Guide](https://cliffano.github.io/developers-guide-makefile.html)
<!-- END:DEVELOPERS_GUIDE -->

<!-- BEGIN:BUILD_REPORTS -->
Build reports:

<!-- END:BUILD_REPORTS -->

<img align="right" src="https://raw.github.com/cliffano/generator-generator/main/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/cliffano/generator-generator/workflows/CI/badge.svg)](https://github.com/cliffano/generator-generator/actions?query=workflow%3ACI)
[![Code Scanning Status](https://github.com/cliffano/generator-generator/workflows/CodeQL/badge.svg)](https://github.com/cliffano/generator-generator/actions?query=workflow%3ACodeQL)
[![Security Status](https://snyk.io/test/github/cliffano/generator-generator/badge.svg)](https://snyk.io/test/github/cliffano/generator-generator)

Generator-Generator
-------------------

The Generator that generates generators using [Plop](https://plopjs.com/).

It provides the following component:

| Component | Description |
|-----------|-------------|
| component-generator | Generate a generator project to generate more code. |

Usage
-----

Generate code generator project:

    make generate-component-generator

This component will prompt you the following inputs:

| Prompt | Description |
|--------|-------------|
| Project ID | Used for package names and project repo name. |
| Project Name | Used in documentation or comments. |
| Project Description | Used in documentation or comments. |
| Author Name | The name of the project author. |
| Author Email | The email of the project author. |
| Author URL | The author's website URL. |
| GitHub ID | The GitHub ID of the project repo. |

Move to the generated project directory:

    cd stage/<component>/

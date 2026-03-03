<img align="right" src="https://raw.github.com/{{ github_id }}/{{ github_repo }}/main/avatar.jpg" alt="Avatar"/>

[![Build Status](https://github.com/{{ github_id }}/{{ github_repo }}/workflows/CI/badge.svg)](https://github.com/{{ github_id }}/{{ github_repo }}/actions?query=workflow%3ACI)
[![Security Status](https://snyk.io/test/github/{{ github_id }}/{{ github_repo }}/badge.svg)](https://snyk.io/test/github/{{ github_id }}/{{ github_repo }})
<br/>

{{ project_name }}
\{{underline "-" project_name.length}}

{{ project_name }} is {{ project_desc }}.

It provides the following components:

| Component | Description |
|-----------|-------------|
| {{ component_name }} | <some_component_desc> |

Usage
-----

Generate code generator project:

    make generate-{{ component_name }}

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

    cd stage/{{ component_name }}/

Configuration
-------------

| Key | Value |
|-----|-------|
| project_id | {{ project_id }} |
| project_name | {{ project_name }} |
| project_desc | {{ project_desc }} |
| author_name | {{ author_name }} |
| author_email | {{ author_email }} |
| github_id | {{ github_id }} |
| github_repo | {{ github_repo }} |

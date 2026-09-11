# AGENTS.md

This repository contains a Plop-based code generator project following a
unified standard for tooling, build automation, and coding conventions. All
projects in this family share the same conventions to keep generators
consistent and maintainable.

The key components of the standard include:

- Code generation ([Plop](https://plopjs.com/))
- Config-driven generation (`-with-config` targets backed by YAML config files)
- README partial snippet generation
- Configuration tooling (yq)

This document outlines the common conventions that apply across the
Plop-based code generator projects.

## Runtime & Dependencies

- **Node.js Version**: 26
- **Dependency Manager**: npm
- **Code Generation**: Plop
- **Configuration Tooling**: yq

### Adding Dependencies

```bash
npm install package_name          # Add runtime dependency
npm install --save-dev pkg_name   # Add development dependency
make deps                         # Install all dependencies
```

## Project Structure

```text
project/
├── examples/                # Sample {{component_name}}(.yml) config files for -with-config targets
├── templates/                # Plop template files for the {{component_name}} component
├── .github/                  # GitHub workflows
├── Makefile                   # Build automation (generate/test targets)
├── package.json                # npm package definition
├── plopfile.js                  # Plop generator definitions
└── README.md                     # Project README
```

## Build Automation

This project uses a **Makefile** driving **Plop** to generate `{{component_name}}`
and `{{component_name}}-partials` projects.

### Common Commands

```bash
make ci                                        # Run clean + stage + deps + test-{{component_name}} + test-{{component_name}}-partials
make clean                                      # Remove staged/generated files
make deps                                       # Install npm dependencies
make generate-{{component_name}}                # Generate {{component_name}} interactively
make generate-{{component_name}}-with-config    # Generate {{component_name}} from a YAML config file
make generate-{{component_name}}-partials       # Generate README partials interactively
make generate-{{component_name}}-partials-with-config  # Generate README partials from a YAML config file
make test-{{component_name}}                    # Generate {{component_name}} from examples/{{component_name}}.yml and run its own `make ci`
make test-{{component_name}}-partials           # Generate {{component_name}}-partials from examples/{{component_name}}-partials.yml
```

`-with-config` targets read their inputs via `yq` from a `generator.component` /
`generator.inputs.*` shaped YAML file, defaulting to `{{component_name}}.yml`
(override with `GENERATOR_CONFIG=path/to/config.yml`).

## Development Environment

This project is designed to be developed in a consistent environment via Docker
image `cliffano/studio`.

You can run the container using: `docker run --rm --workdir /opt/workspace -v /var/run/docker.sock:/var/run/docker.sock -v $PWD:/opt/workspace -i -t cliffano/studio` and then run the build commands inside the container.

## Code Style and Linting

- Generated output should stay traceable to its `templates/` and `plopfile.js` sources
- Workflow and Makefile changes should stay deterministic and minimal

### Generator Code Guidelines

Applies to: `.github/workflows/**/*.yml`, `.github/workflows/**/*.yaml`, `plopfile.js`, `templates/**/*`, `examples/**/*.yml`, `README.md`, `CHANGELOG.md`

#### Style & Formatting

##### Workflow and Build Config

All workflow and build configuration changes should stay explicit, readable, and
reproducible.

Guidelines:

- Use two-space indentation in YAML files
- Keep workflow/job/step names descriptive
- Avoid compact one-liners that hide intent in CI definitions
- Keep shell snippets readable and fail fast

##### Plop Generator Definitions

Guidelines:

- Keep prompts in `plopfile.js` consistent between the main and `-partials` generators
- Keep `actions` focused on `addMany` file generation; avoid embedding heavy logic in helpers
- Keep prompt field names stable, since `-with-config` targets depend on matching `generator.inputs.*` keys

##### Example Config Files

Guidelines:

- Keep `examples/*.yml` in sync with the prompts declared in `plopfile.js`
- Keep example values realistic and directly usable for local testing

#### Generator Structure Conventions

- Keep the main component's template files in `templates/{{component_name}}/`
- Keep the partials component's template files in `templates/{{component_name}}-partials/`
- Keep sample configs in `examples/`

#### Validation

- Treat a failing `test-{{component_name}}` or `test-{{component_name}}-partials` as a build failure
- Run `make ci` before merging generator or template changes

## Testing

- This project emphasizes deterministic generate-and-verify checks rather than a dedicated unit test suite
- Run validation with `make ci`

### Testing Guidelines

Applies to: `.github/workflows/**/*.yml`, `.github/workflows/**/*.yaml`

#### Validation Strategy

This project currently relies on deterministic validation via generating a
sample project from `examples/` and running its own build, rather than
dedicated unit test suites.

Primary validation commands:

```bash
make ci
make test-{{component_name}}
make test-{{component_name}}-partials
```

#### What to Validate

- Generated `{{component_name}}` output builds successfully (`make test-{{component_name}}`)
- Generated `{{component_name}}-partials` output is produced without error
- `-with-config` targets correctly resolve values from `examples/*.yml`
- Workflow execution consistency for CI flows

#### Workflow Test Practices

- Keep CI steps deterministic and idempotent
- Avoid network-dependent checks beyond `npm install`
- Fail fast on missing or malformed example config values

#### Regression Prevention

When changing `plopfile.js`, `Makefile` targets, or template files:

1. Run `make generate-{{component_name}}-with-config` and inspect the generated output
2. Run `make test-{{component_name}}`
3. Run `make test-{{component_name}}-partials`
4. Verify `examples/*.yml` still matches the current prompt field names

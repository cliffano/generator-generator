################################################################
# \{{project_name}}: \{{project_desc}}
# https://github.com/\{{github_id}}/\{{github_repo}}
################################################################

# \{{project_name}}'s version number
\{{prefixConst project_id}}_VERSION = 2.0.0

$(info ################################################################)
$(info Building TODO using Makefile:)

define python_venv
	. .venv/bin/activate && $(1)
endef

################################################################
# Base targets

# CI target to be executed by CI/CD tool
ci: clean deps-upgrade deps lint test

# All target is just an alias to ci target
all: clean deps lint test

# Ensure stage directory exists
stage:
	mkdir -p stage

# Remove all temporary (staged, generated, cached) files
clean:
	rm -rf stage/

rmdeps:
	rm -rf .venv/

deps:
	python3 -m venv .venv
	$(call python_venv,python3 -m pip install -r requirements.txt)

deps-upgrade:
	python3 -m venv .venv
	$(call python_venv,python3 -m pip install -r requirements-dev.txt)
	$(call python_venv,pip-compile --upgrade)

lint:
	$(call python_venv,yamllint .)

# Update Makefile to the latest version tag
update-to-latest: TARGET_\{{uppercase project_id}}_VERSION = $(shell curl -s https://api.github.com/repos/\{{github_id}}/\{{github_repo}}/tags | jq -r '.[0].name')
update-to-latest: update-to-version

# Update Makefile to the main branch
update-to-main:
	curl https://raw.githubusercontent.com/\{{github_id}}/\{{github_repo}}/main/src/Makefile-\{{project_id}} -o Makefile

# Update Makefile to the version defined in TARGET_\{{uppercase project_id}}_VERSION parameter
update-to-version:
	curl https://raw.githubusercontent.com/\{{github_id}}/\{{github_repo}}/$(TARGET_\{{uppercase project_id}}_VERSION)/src/Makefile-\{{project_id}} -o Makefile

.PHONY: ci all clean rmdeps deps deps-upgrade lint test update-to-latest update-to-main update-to-version stage x-test-fixtures

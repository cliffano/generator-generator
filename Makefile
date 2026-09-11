ci: clean stage deps test-component-generator

clean:
	rm -rf stage/

stage:
	mkdir -p stage/

deps:
	npm install .

clean-component-generator:
	rm -rf stage/component-generator/

########################################
# Utility targets
########################################

GENERATOR_CONFIG ?= generatoo.yml

define set_generator_vars
$(1): GENERATOR_COMPONENT = $$(shell yq .generator.component $(2))
$(1): GENERATOR_INPUTS_PROJECT_ID = $$(shell yq .generator.inputs.project_id $(2))
$(1): GENERATOR_INPUTS_PROJECT_NAME = $$(shell yq .generator.inputs.project_name $(2))
$(1): GENERATOR_INPUTS_PROJECT_DESC = $$(shell yq .generator.inputs.project_desc $(2))
$(1): GENERATOR_INPUTS_COMPONENT_NAME = $$(shell yq .generator.inputs.component_name $(2))
$(1): GENERATOR_INPUTS_AUTHOR_NAME = $$(shell yq .generator.inputs.author_name $(2))
$(1): GENERATOR_INPUTS_AUTHOR_EMAIL = $$(shell yq .generator.inputs.author_email $(2))
$(1): GENERATOR_INPUTS_AUTHOR_URL = $$(shell yq .generator.inputs.author_url $(2))
$(1): GENERATOR_INPUTS_GITHUB_ID = $$(shell yq .generator.inputs.github_id $(2))
$(1): GENERATOR_INPUTS_GITHUB_REPO = $$(shell yq .generator.inputs.github_repo $(2))
$(1): GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX = $$(shell yq .generator.inputs.github_token_prefix $(2))
endef

generate-component-generator: clean-component-generator
	node_modules/.bin/plop component-generator

$(eval $(call set_generator_vars,generate-component-generator-with-config,$(GENERATOR_CONFIG)))
generate-component-generator-with-config: clean-component-generator
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--component_name "$(GENERATOR_INPUTS_COMPONENT_NAME)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-component-generator: clean-component-generator
	make generate-component-generator-with-config GENERATOR_CONFIG=examples/generatoo-component-generator.yml
	cd stage/component-generator/ && \
	  make ci

.PHONY: ci clean clean-component-generator stage deps generate-component-generator generate-component-generator-with-config test-component-generator

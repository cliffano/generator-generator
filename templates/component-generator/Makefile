ci: clean stage deps test-{{component_name}} test-{{component_name}}-partials

clean:
	rm -rf stage/

clean-{{component_name}}:
	rm -rf stage/{{component_name}}/

stage:
	mkdir -p stage/

deps:
	npm install .

########################################
# Utility targets
########################################

GENERATOR_CONFIG ?= {{component_name}}.yml

define set_generator_vars
$(1): GENERATOR_COMPONENT = $$(shell yq .generator.component $(2))
$(1): GENERATOR_INPUTS_PROJECT_ID = $$(shell yq .generator.inputs.project_id $(2))
$(1): GENERATOR_INPUTS_PROJECT_NAME = $$(shell yq .generator.inputs.project_name $(2))
$(1): GENERATOR_INPUTS_PROJECT_DESC = $$(shell yq .generator.inputs.project_desc $(2))
$(1): GENERATOR_INPUTS_AUTHOR_NAME = $$(shell yq .generator.inputs.author_name $(2))
$(1): GENERATOR_INPUTS_AUTHOR_EMAIL = $$(shell yq .generator.inputs.author_email $(2))
$(1): GENERATOR_INPUTS_AUTHOR_URL = $$(shell yq .generator.inputs.author_url $(2))
$(1): GENERATOR_INPUTS_GITHUB_ID = $$(shell yq .generator.inputs.github_id $(2))
$(1): GENERATOR_INPUTS_GITHUB_REPO = $$(shell yq .generator.inputs.github_repo $(2))
$(1): GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX = $$(shell yq .generator.inputs.github_token_prefix $(2))
endef

########################################
# {{component_name}} targets
########################################

generate-{{component_name}}: clean-{{component_name}}
	node_modules/.bin/plop {{component_name}}

$(eval $(call set_generator_vars,generate-{{component_name}}-with-config,$(GENERATOR_CONFIG)))
generate-{{component_name}}-with-config: clean-{{component_name}}
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-{{component_name}}: clean-{{component_name}}
	make generate-{{component_name}}-with-config GENERATOR_CONFIG=examples/{{component_name}}.yml
	cd stage/{{component_name}}/ && \
	  make ci

########################################
# {{component_name}}-partials targets
########################################

clean-{{component_name}}-partials:
	rm -rf stage/{{component_name}}-partials/

generate-{{component_name}}-partials: clean-{{component_name}}-partials
	node_modules/.bin/plop {{component_name}}-partials

$(eval $(call set_generator_vars,generate-{{component_name}}-partials-with-config,$(GENERATOR_CONFIG)))
generate-{{component_name}}-partials-with-config: clean-{{component_name}}-partials
	node_modules/.bin/plop $(GENERATOR_COMPONENT) -- \
	    --project_id "$(GENERATOR_INPUTS_PROJECT_ID)" \
		--project_name "$(GENERATOR_INPUTS_PROJECT_NAME)" \
		--project_desc "$(GENERATOR_INPUTS_PROJECT_DESC)" \
		--author_name "$(GENERATOR_INPUTS_AUTHOR_NAME)" \
		--author_email "$(GENERATOR_INPUTS_AUTHOR_EMAIL)" \
		--author_url "$(GENERATOR_INPUTS_AUTHOR_URL)" \
		--github_id "$(GENERATOR_INPUTS_GITHUB_ID)" \
		--github_repo "$(GENERATOR_INPUTS_GITHUB_REPO)" \
		--github_token_prefix "$(GENERATOR_INPUTS_GITHUB_TOKEN_PREFIX)"

test-{{component_name}}-partials: clean-{{component_name}}-partials
	make generate-{{component_name}}-partials-with-config GENERATOR_CONFIG=examples/{{component_name}}-partials.yml

.PHONY: ci clean clean-{{component_name}} stage deps generate-{{component_name}} generate-{{component_name}}-with-config test-{{component_name}} clean-{{component_name}}-partials generate-{{component_name}}-partials generate-{{component_name}}-partials-with-config test-{{component_name}}-partials

ci: clean stage deps test-component-generator

clean:
	rm -rf stage/

stage:
	mkdir -p stage/

deps:
	npm install .

clean-component-generator:
	rm -rf stage/component-generator/

generate-component-generator: clean-component-generator
	node_modules/.bin/plop component-generator

test-component-generator:
	node_modules/.bin/plop component-generator -- \
	    --project_id "generator-component" \
		--project_name "Generator-Component" \
		--project_desc "Component projects generator" \
		--component_name "component" \
		--author_name "Cliffano Subagio" \
		--author_email "cliffano@gmail.com" \
		--author_url "https://github.com/cliffano" \
		--github_id "cliffano" \
		--github_repo "generator-component"
	cd stage/component-generator/ && \
	  make ci

.PHONY: ci clean clean-component-generator stage deps generate-component-generator generate-oag-url-spec test-component-generator

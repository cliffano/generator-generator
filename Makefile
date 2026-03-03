ci: clean stage deps test-code-generator

clean:
	rm -rf stage/

stage:
	mkdir -p stage/

deps:
	npm install .

clean-code-generator:
	rm -rf stage/code-generator/

generate-code-generator: clean-code-generator
	node_modules/.bin/plop code-generator

test-code-generator:
	node_modules/.bin/plop code-generator -- \
	    --project_id "generator-makefile" \
		--project_name "Generator-Makefile" \
		--project_desc "Makefile projects generator" \
		--component_name "makefile" \
		--author_name "Cliffano Subagio" \
		--author_email "cliffano@gmail.com" \
		--author_url "https://github.com/cliffano" \
		--github_id "cliffano" \
		--github_repo "generator-makefile"
	cd stage/code-generator/ && \
	  make ci

.PHONY: ci clean clean-code-generator stage deps generate-code-generator generate-oag-url-spec test-code-generator

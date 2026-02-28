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
	    --project_id "code-generator" \
		--project_name "Code Generator" \
		--project_desc "Simple Code Generator" \
		--author_name "Pakkun" \
		--author_email "blah+pakkun@cliffano.com" \
		--author_url "https://github.com/pakkunbot" \
		--github_id "pakkunbot"
	cd stage/code-generator/ && \
	  make ci

.PHONY: ci clean clean-code-generator stage deps generate-code-generator generate-oag-url-spec test-code-generator

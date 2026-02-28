ci: clean stage deps test-some-component

clean:
	rm -rf stage/

clean-some-component:
	rm -rf stage/some-component/

stage:
	mkdir -p stage/

deps:
	npm install .

generate-some-component: clean-some-component
	node_modules/.bin/plop some-component

test-some-component:
	node_modules/.bin/plop some-component -- \
	    --project_id "some-component" \
		--project_name "Some Component" \
		--project_desc "A sample component project" \
		--author_name "Pakkun" \
		--author_email "blah+pakkun@cliffano.com" \
		--github_id "pakkunbot" \
		--github_repo "some-component"
	cd stage/some-component/ && \
	  make ci

.PHONY: ci clean clean-some-component stage deps generate-some-component test-some-component
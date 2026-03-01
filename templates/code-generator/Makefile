ci: clean stage deps test-{{ component_name }}

clean:
	rm -rf stage/

clean-{{ component_name }}:
	rm -rf stage/{{ component_name }}/

stage:
	mkdir -p stage/

deps:
	npm install .

generate-{{ component_name }}: clean-{{ component_name }}
	node_modules/.bin/plop {{ component_name }}

test-{{ component_name }}:
	node_modules/.bin/plop {{ component_name }} -- \
	    --project_id "{{ project_id }}" \
		--project_name "{{ project_name }}" \
		--project_desc "{{ project_desc }}" \
		--author_name "{{ author_name }}" \
		--author_email "{{ author_email }}" \
		--github_id "{{ github_id }}" \
		--github_repo "{{ github_repo }}"
	cd stage/{{ component_name }}/ && \
	  make ci

.PHONY: ci clean clean-{{ component_name }} stage deps generate-{{ component_name }} test-{{ component_name }}
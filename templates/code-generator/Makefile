ci: clean stage deps test-{{ project_id }}

clean:
	rm -rf stage/

clean-{{ project_id }}:
	rm -rf stage/{{ project_id }}/

stage:
	mkdir -p stage/

deps:
	npm install .

generate-{{ project_id }}: clean-{{ project_id }}
	node_modules/.bin/plop {{ project_id }}

test-{{ project_id }}:
	node_modules/.bin/plop {{ project_id }} -- \
	    --project_id "{{ project_id }}" \
		--project_name "{{ project_name }}" \
		--project_desc "{{ project_desc }}" \
		--author_name "{{ author_name }}" \
		--author_email "{{ author_email }}" \
		--github_id "{{ github_id }}" \
		--github_repo "{{ github_repo }}"
	cd stage/{{ project_id }}/ && \
	  make ci

.PHONY: ci clean clean-{{ project_id }} stage deps generate-{{ project_id }} test-{{ project_id }}
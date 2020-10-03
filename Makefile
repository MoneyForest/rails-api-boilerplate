.PHONY: ci/static-code-analysis
ci/static-code-analysis:
	bundle exec rubocop -a . &&  \
		bundle exec brakeman -A -w3 -q . && \
			bundle exec rails_best_practices .

.PHONY: docker/run-swagger-editor
docker/run-swagger-editor:
	cd docs/api/ && \
		docker-compose up -d swagger-editor

.PHONY: docker/stop-swagger-editor
docker/stop-swagger-editor:
	cd docs/api/ && \
		docker-compose down

.PHONY: rails/db-seed
rails/db-seed:
	bundle exec rails db:seed

.PHONY: rake/ridgepole-apply
rake/ridgepole-apply:
	bundle exec rake ridgepole:apply

.PHONY: rake/ridgepole-export
rake/ridgepole-export:
	bundle exec rake ridgepole:export

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

.PHONY: rails/db-apply
rails/db-apply:
	bundle exec rake ridgepole:apply

.PHONY: rake/db-export
rake/db-export:
	bundle exec rake ridgepole:export

.PHONY: rails/db-reset
rails/db-reset:
	bundle exec rails db:drop && \
		bundle exec rails db:create && \
			make rake/ridgepole-apply

.PHONY: rails/db-seed
rails/db-seed:
	make rails/db-reset && \
		bundle exec rails db:seed

.PHONY: rails/routes
rails/routes:
	bundle exec rails routes

.PHONY: rails/run-server
rails/run-server:
	rm -f /tmp/pids/server.pid && bundle exec rails server

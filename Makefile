.PHONY: ci/static-code-analysis
ci/static-code-analysis:
	bundle exec rubocop -a . &&  \
		bundle exec brakeman -A -w3 -q . && \
			bundle exec rails_best_practices .

.PHONY: docker/db-setup
docker/db-setup:
	docker-compose run app make rails/db-setup

.PHONY: docker/run-swagger-editor
docker/run-swagger-editor:
	cd docs/api/ && \
		docker-compose up -d swagger-editor

.PHONY: docker/run-app
docker/run-app:
	docker-compose up -d

.PHONY: docker/stop-swagger-editor
docker/stop-swagger-editor:
	cd docs/api/ && \
		docker-compose down

.PHONY: docker/stop-app
docker/stop-app:
	docker-compose down

.PHONY: rails/db-apply
rails/db-apply:
	bundle exec rake ridgepole:apply

.PHONY: rails/db-erd-generate
rails/db-erd-generate:
	bundle exec erd --filename=docs/db/erd

.PHONY: rails/db-export
rails/db-export:
	bundle exec rake ridgepole:export

.PHONY: rails/db-reset
rails/db-reset:
	bundle exec rails db:drop && \
		bundle exec rails db:create && \
			make rails/db-apply

.PHONY: rails/db-seed
rails/db-seed:
	make rails/db-reset && \
		bundle exec rails db:seed

.PHONY: rails/db-setup
rails/db-setup:
	make rails/db-seed

.PHONY: rails/gem-sorter
rails/gem-sorter:
	bundle exec ordinare

.PHONY: rails/routes
rails/routes:
	rm -rf docs/routes/routes.txt && \
		bundle exec rails routes > docs/routes/routes.txt && \
			bundle exec rails routes

.PHONY: rails/run-server
rails/run-server:
	rm -f /tmp/pids/server.pid && bundle exec rails server

.PHONY: rails/run-rspec
rails/run-rspec:
	bundle exec rspec

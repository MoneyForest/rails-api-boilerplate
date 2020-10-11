.PHONY: ci/validate
ci/config-validate:
	circleci config validate

.PHONY: ci/local-execute-rspec
ci/local-execute-rspec:
	circleci local execute --job rspec

.PHONY: ci/local-execute-rubocop
ci/local-execute-rubocop:
	circleci local execute --job rubocop

.PHONY: lint/security
lint/security:
	bundle exec brakeman

.PHONY: docker/build-app
docker/build-app:
	docker-compose build

.PHONY: docker/db-setup
docker/db-setup:
	docker-compose run app make rails/db-setup

.PHONY: docker/run-app
docker/run-app:
	docker-compose up -d

.PHONY: docker/run-swagger
docker/run-swagger:
	cd docs/api/ && \
		docker-compose up -d swagger-editor swagger-ui

.PHONY: docker/stop-app
docker/stop-app:
	docker-compose down

.PHONY: docker/stop-swagger
docker/stop-swagger:
	cd docs/api/ && \
		docker-compose down

.PHONY: lint/best-practice
lint/best-practice:
	bundle exec rails_best_practices

.PHONY: lint/code-smell-detector
lint/code-smell-detector:
	bundle exec reek

.PHONY: lint/ruby
lint/ruby:
	bundle exec rubocop -a

.PHONY: lint/ruby-setup
lint/ruby-setup:
	bundle exec rubocop --auto-gen-config

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
	bundle exec rubocop -a Gemfile

.PHONY: rails/routes
rails/routes:
	rm -rf docs/routes/routes.txt && \
		bundle exec rails routes > docs/routes/routes.txt && \
			bundle exec rails routes

.PHONY: rails/run-server
rails/run-server:
	rm -f /tmp/pids/server.pid && bundle exec rails server -p 8080 -b 0.0.0.0

.PHONY: rails/run-rspec
rails/run-rspec:
	bundle exec rspec

.PHONY: rails/tmp-cache-clear
rails/tmp-cache-clear:
	bundle exec rails tmp:cache:clear

.PHONY: docker/run-swagger-editor
docker/run-swagger-editor:
	cd docs/api/ && \
		docker-compose up -d swagger-editor

.PHONY: docker/stop-swagger-editor
docker/stop-swagger-editor:
	cd docs/api/ && \
		docker-compose down

.PHONY: rake/ridgepole-apply
rake/ridgepole-apply:
	bundle exec rake ridgepole:apply

.PHONY: rake/ridgepole-export
rake/ridgepole-export:
	bundle exec rake ridgepole:export

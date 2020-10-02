## rails-api-boilerplate

this repo is boilerplate for quick API development in Rails API mode.

## Installation

- rbenv installed on Homebrewrbenv installed on Homebrew

#### Confirm installation of ruby 2.7.1

```
$ rbenv install --list
```

- if 2.7.1 is not included, update ruby-build

```
$ brew update
$ brew upgrade ruby-build
```

#### Installation of ruby 2.7.1

```
$ rbenv install 2.7.1
$ rbenv local 2.7.1
```

#### Installation of bundler and gem

```
$ rbenv exec gem install bundler
$ bundle install
```

#### Create DB

```
$ bundle exec rails db:create
```

#### Migrate DB

- Start MySQL locally before

```
$ make rake/ridgepole-apply
```

## How to edit API spec

```
$ make docker/run-swagger-editor
```
- Access to http://localhost:8080/ and begin editing
- When you are done, go to > File/Save as YAML and overwrite the current `openapi.yaml` file

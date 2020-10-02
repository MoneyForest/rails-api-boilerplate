## rails-api-boilerplate

- this repo is boilerplate for quick API development in Rails API mode.

## How to install

- rbenv installed on Homebrewrbenv installed on Homebrew

#### Setup env
```
export DB_LOCAL_USERNAME=user
export DB_LOCAL_PASSWORD=password
export DB_LOCAL_HOST=localhost
```

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

## How to develop

### How to edit API spec

```
$ make docker/run-swagger-editor
```
- Access to http://localhost:8080/ and begin editing
- When you are done, go to > File/Save as YAML and overwrite the current `openapi.yaml` file

### How to edit DB scheme
- Edit DB schema by SQL ex) ALTER TABLE
- If DB schema is good, execute 'make rake/ridgepole-export' 
```
$ make rake/ridgepole-export
```
- DB schema is exported to Schemafile and commit it

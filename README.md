## rails-api-boilerplate

- This repo is sample boilerplate for quick API development in Rails API mode.
- This sample is backend api server of task management application

---

## How to setup

- rbenv installed on Homebrewrbenv installed on Homebrew

### Environment

```
export DB_LOCAL_USERNAME=user
export DB_LOCAL_PASSWORD=password
export DB_LOCAL_HOST=localhost
```

### Application

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

### DataBase

- Start MySQL locally before

```
$ make rails/db-setup
```

---

## How to develop

### How to edit API spec

```
$ make docker/run-swagger-editor
```

- Access to http://localhost:8000/ and begin editing
- When you are done, go to > File/Save as YAML and overwrite the current `openapi.yaml` file
- Access to http://localhost:8001/ and can show swagger ui

### How to edit DB scheme

- Edit DB schema by SQL ex) ALTER TABLE
- If DB schema is good, execute 'make rails/db-export' 

```
$ make rails/db-export
```

- DB schema is exported to Schemafile and commit it
- Run generate E-R diagram command after edit DB schema

```
$ rails/db-erd-generate
```

### How to edit Gemfile

- Run sort command after edit Gemfile 

```
$ make rails/gem-sorter
```

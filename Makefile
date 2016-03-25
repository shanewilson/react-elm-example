PROJECT = "React Elm Example"

PATH  := node_modules/.bin:$(PATH)
SHELL := /bin/bash

ifndef VERBOSE
	Q := @
	NIL := > /dev/null 2>&1
endif

NODE_ENV ?= development

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
OK_STRING=$(OK_COLOR)[OK]$(NO_COLOR)
AWK_CMD = awk '{ printf "%-30s %-10s\n",$$1, $$2; }'
PRINT_OK = printf "$@ $(OK_STRING)\n" | $(AWK_CMD)
NODE_ENV_STRING = $(OK_COLOR)[$(NODE_ENV)]$(NO_COLOR)
PRINT_ENV = printf "$@ $(NODE_ENV_STRING)\n" | $(AWK_CMD)

all: install dist

server:
	$(Q) node server.babel

install: npm-install elm-install

npm-install:
	$(Q) npm install --loglevel error
	@$(PRINT_OK)

elm-install:
	elm-package install -y
	cd src/elm/tests && elm-package install -y

build: clean-dist
	@$(PRINT_ENV)
	$(Q) webpack
	@$(PRINT_OK)

dist: prepare build
	@$(PRINT_OK)

prepare: lint elm-test test-once
	@$(PRINT_OK)

elm-test:
	cd src/elm/tests && elm-test TestRunner.elm
	@$(PRINT_OK)

test:
	TEST_ENV=watch karma start karma.config.js

test-once:
	TEST_ENV=single karma start karma.config.js
	@$(PRINT_OK)

lint:
	$(Q) eslint src --ext .js,.jsx
	@$(PRINT_OK)

clean: clean-dist clean-deps clean-elm
	@$(PRINT_OK)

clean-dist:
	$(Q) rm -rf dist
	@$(PRINT_OK)

clean-deps:
	$(Q) rm -rf node_modules
	@$(PRINT_OK)

clean-elm:
	$(Q) rm -rf elm-stuff src/elm/tests/elm-stuff
	@$(PRINT_OK)

update:
	$(Q) david
	@$(PRINT_OK)

upgrade:
	$(Q) david update
	@$(PRINT_OK)

logs:
	$(Q) node ./bin/changelog.js
	@$(PRINT_OK)

.PHONY: install start server build dist prepare test test-once lint flow clean clean-dist clean-deps update upgrade logs

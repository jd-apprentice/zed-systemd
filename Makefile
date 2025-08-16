grammar_route ?= grammars/systemd_service

install:
	cd $(grammar_route) && npm install

prepare:
	cd $(grammar_route) && npm run build

.PHONY: build move install

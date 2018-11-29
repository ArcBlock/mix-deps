TOP_DIR=.
VERSION=$(strip $(shell cat version))

travis-init: extract-deps
	@echo "Initialize software required for travis (normally ubuntu software)"

travis:
	@echo "Success"

travis-deploy: build-release release
	@echo "Deploy the software by travis"

include .makefiles/*.mk

.PHONY: travis-init travis bump-version create-pr

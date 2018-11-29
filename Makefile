TOP_DIR=.
VERSION=$(strip $(shell cat version))

dep:
	@echo "Install dependencies required for this repo..."
	@cd src; mix deps.get

travis-init: extract-deps
	@echo "Initialize software required for travis (normally ubuntu software)"

travis:
	@echo "Success"

travis-deploy: build-release release
	@echo "Deploy the software by travis"

include .makefiles/*.mk

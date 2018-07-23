BUILD_VERSION=v$(VERSION)
RELEASE_DIR=$(TOP_DIR)/_build/releases

build-all:
	@echo "Building all dependencies..."
	@mix deps.get; MIX_ENV=prod mix compile; MIX_ENV=staging mix compile; MIX_ENV=dev mix compile; MIX_ENV=test mix compile;
	@tar zcvf deps.tgz deps/
	@tar zcvf builds.tgz _build/
	@mv *.tgz $(RELEASE_DIR)

build-version-file:
	@echo "$(BUILD_VERSION)" > $(RELEASE_DIR)/$(BUILD_VERSION)

$(RELEASE_DIR):
	@mkdir -p $@

build-release: $(RELEASE_DIR) build-version-file build-all

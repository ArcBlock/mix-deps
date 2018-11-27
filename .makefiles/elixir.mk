BUILD_VERSION=v$(VERSION)
RELEASE_DIR=$(TOP_DIR)/_build/releases

build-all:
	@echo "Building all dependencies..."
	@mix deps.get;
	@echo "Building dependencies for MIX_ENV=prod..."; MIX_ENV=prod mix compile
	@echo "Building dependencies for MIX_ENV=staging..."; MIX_ENV=staging mix compile
	@echo "Building dependencies for MIX_ENV=dev..."; MIX_ENV=dev mix compile
	@echo "Building dependencies for MIX_ENV=test..."; MIX_ENV=test mix compile
	@tar zcf deps.tgz deps/
	@tar zcf builds.tgz _build/
	@rm $(RELEASE_DIR)/v*
	@mv *.tgz $(RELEASE_DIR)

build-version-file:
	@echo "$(BUILD_VERSION)" > $(RELEASE_DIR)/$(BUILD_VERSION)

$(RELEASE_DIR):
	@mkdir -p $@

build-release: $(RELEASE_DIR) build-all build-version-file

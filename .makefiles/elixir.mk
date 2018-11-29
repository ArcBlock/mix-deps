SRC=$(TOP_DIR)/src
BUILD_VERSION=v$(VERSION)
RELEASE_DIR=$(SRC)/_build/releases

build-all:
	@echo "Building all dependencies..."
	@cd $(SRC); mix deps.get
	@echo "Building dependencies for MIX_ENV=prod..."
	@cd $(SRC); MIX_ENV=prod mix compile
	@echo "Building dependencies for MIX_ENV=staging..."
	@cd $(SRC); MIX_ENV=staging mix compile
	@echo "Building dependencies for MIX_ENV=dev..."
	@cd $(SRC); MIX_ENV=dev mix compile
	@echo "Building dependencies for MIX_ENV=test..."
	@cd $(SRC); MIX_ENV=test mix compile
	@tar zcf deps.tgz $(SRC)/deps/
	@tar zcf builds.tgz $(SRC)/_build/
	@mv *.tgz $(RELEASE_DIR)

build-version-file:
	@echo "$(BUILD_VERSION)" > $(RELEASE_DIR)/$(BUILD_VERSION)

$(RELEASE_DIR):
	@mkdir -p $@

build-release: $(RELEASE_DIR) build-all build-version-file

# MixDeps

Least common multiple for Elixir dependencies for Travis ci.

## Usage

Add `.makefiles/dep.mk` to repo, remember to change the `DEPS_VER` to desired version number.

```Makefile
SRC=.
DEPS_VER=vx.x.x
DEPS_PREFIX=https://github.com/ArcBlock/mix-deps/releases/download
BUILDS_FILE=builds.tgz
DEPS_FILE=deps.tgz
BUILDS_URL=$(DEPS_PREFIX)/$(DEPS_VER)/$(BUILDS_FILE)
DEPS_URL=$(DEPS_PREFIX)/$(DEPS_VER)/$(DEPS_FILE)

extract-deps:
	@echo "Extracting deps from mix-deps repo $(DEPS_VER)..."
	@cd $(SRC); wget $(BUILDS_URL) --quiet; wget $(DEPS_URL) --quiet; tar zxf $(BUILDS_FILE); tar zxf $(DEPS_FILE); rm $(BUILDS_FILE) $(DEPS_FILE);
```

Then update `Makefile`

```Makefile
travis-init: extract-deps
	@echo "Initialize software required for travis (normally ubuntu software)"
```

## How to update

1. Update `DEPS_VER` in `.makefiles/dep.mk` to last release version of this repo itself for incremental build
2. Update `deps` in `mix.exs`, then `$ make dep`

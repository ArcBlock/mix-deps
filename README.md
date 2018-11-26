# MixDeps

Least common multiple for Elixir dependencies.

## Usage

Add `.makefiles/dep.mk` to repo

```Makefile
SRC=.
DEPS_VER=vx.x.x
DEPS_PREFIX=https://github.com/ArcBlock/mix-deps/releases/download
BUILDS_FILE=builds.tgz
DEPS_FILE=deps.tgz
BUILDS_URL=$(DEPS_PREFIX)/$(DEPS_VER)/$(BUILDS_FILE)
DEPS_URL=$(DEPS_PREFIX)/$(DEPS_VER)/$(DEPS_FILE)

extract-deps:
	@cd $(SRC); wget $(BUILDS_URL) --quiet; wget $(DEPS_URL) --quiet; tar zxf $(BUILDS_FILE); tar zxf $(DEPS_FILE); rm $(BUILDS_FILE) $(DEPS_FILE);
```

Then update `Makefile`

```Makefile
travis-init: extract-deps
	@echo "Initialize software required for travis (normally ubuntu software)"
```

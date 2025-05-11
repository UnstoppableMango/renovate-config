# renovate: datasource=github-tags depName=dprint/dprint
DPRINT_VERSION ?= 0.50.0
DPRINT := ${CURDIR}/bin/dprint

# https://github.com/oven-sh/bun/issues/7034
validate:
	bun validate.sh

format: bin/dprint
	$(DPRINT) fmt

bin/bun: .versions/bun | .make/bun/install.sh
	BUN_INSTALL=${CURDIR} .make/bun/install.sh && rm _bun

bin/dprint: | .make/dprint/install.sh
	DPRINT_INSTALL=${CURDIR} .make/dprint/install.sh ${DPRINT_VERSION}
	@touch $@

.git/hooks/pre-commit: .githooks/pre-commit
	cp $< $@

.vscode/settings.json: hack/vscode-settings.json
	cp $< $@

.make/dprint/install.sh:
	@mkdir -p $(dir $@)
	curl -fsSL https://dprint.dev/install.sh -o $@
	@chmod +x $@

.make/bun/install.sh:
	@mkdir -p $(dir $@)
	curl -fsSL https://bun.sh/install -o $@
	@chmod +x $@

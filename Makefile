# renovate: datasource=github-tags depName=dprint/dprint
DPRINT_VERSION ?= 0.50.2
DPRINT ?= ${CURDIR}/bin/dprint

validate:
	bunx --yes --package renovate -- renovate-config-validator --strict default.json

format: $(DPRINT)
	$(DPRINT) fmt

bin/dprint: | .make/dprint/install.sh
	DPRINT_INSTALL=${CURDIR} .make/dprint/install.sh ${DPRINT_VERSION}
	@touch $@

.git/hooks/pre-commit: .githooks/pre-commit
	cp $< $@

.make/dprint/install.sh:
	@mkdir -p $(dir $@)
	curl -fsSL https://dprint.dev/install.sh -o $@
	@chmod +x $@

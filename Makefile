PRESETS := default.json $(wildcard presets/*/default.json)

validate:
	bunx --yes --package renovate -- renovate-config-validator --strict $(PRESETS)

format:
	nix fmt

lint:
	nix fmt -- --ci

.git/hooks/pre-commit: .githooks/pre-commit
	cp $< $@

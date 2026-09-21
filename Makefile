validate:
	bunx --yes --package renovate -- renovate-config-validator --strict default.json

format:
	nix fmt

lint:
	nix fmt -- --ci

.git/hooks/pre-commit: .githooks/pre-commit
	cp $< $@

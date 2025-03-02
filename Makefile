validate:
	npx --yes --package renovate -- renovate-config-validator --strict default.json

.git/hooks/pre-commit: .githooks/pre-commit
	cp $< $@

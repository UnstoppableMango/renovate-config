# UnstoppableMango's Renovate Presets

[![Hercules CI](https://hercules-ci.com/api/v1/site/github/account/UnstoppableMango/project/renovate-config/badge)](https://hercules-ci.com/github/UnstoppableMango/renovate-config)

[Shareable Config Presets](https://docs.renovatebot.com/config-presets/#github-hosted-presets) for renovate stuff I copy-paste everywhere.

## Usage

To use the [default](./default.json) preset:

```json
{
	"extends": ["github>UnstoppableMango/renovate-config"]
}
```

It extends `config:recommended` and `schedule:weekly`, enables the nix manager with `flake.lock` maintenance, and adds regex managers for `.versions/*` files and `dprint-version` workflow inputs.

## Opt-in presets

Add any of these to `extends` alongside the default preset.

| Preset                                                            | Purpose                                                                                                                                  |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `github>UnstoppableMango/renovate-config//presets/release-please` | Commits dependency updates as `deps:` so release-please cuts a release. GitHub Actions pins stay `chore(deps):`.                         |
| `github>UnstoppableMango/renovate-config//presets/nix-comments`   | Updates `.nix` values that have a `# renovate: datasource=... depName=...` comment on the line above. Adjacent hashes are not refreshed. |
| `github>UnstoppableMango/renovate-config//presets/pulumi-yaml`    | Updates `Pulumi.yaml` values that have a `# renovate:` comment on the line above.                                                        |

## Versioning

release-please tags each release as `vX.Y.Z`.
Pin a preset to a release by appending the tag:

```json
{
	"extends": ["github>UnstoppableMango/renovate-config#v1.0.0"]
}
```

release-please owns `CHANGELOG.md`.
Never hand-edit it; each release PR rewrites it.

## Development

Run `renovate-config-validator` against `default.json` and every `presets/*/default.json`.

```shell
make validate
```

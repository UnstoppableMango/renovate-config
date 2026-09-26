# UnstoppableMango's Renovate Presets

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

| Preset                                                   | Purpose                                                                                                                                  |
| -------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- |
| `github>UnstoppableMango/renovate-config:release-please` | Commits dependency updates as `deps:` so release-please cuts a release. GitHub Actions pins stay `chore(deps):`.                         |
| `github>UnstoppableMango/renovate-config:nix-comments`   | Updates `.nix` values that have a `# renovate: datasource=... depName=...` comment on the line above. Adjacent hashes are not refreshed. |
| `github>UnstoppableMango/renovate-config:pulumi-yaml`    | Updates `Pulumi.yaml` values that have a `# renovate:` comment on the line above.                                                        |

Each opt-in preset is a JSON file at the repository root, so Renovate resolves `:<name>` to `<name>.json`.

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

Run `renovate-config-validator` against `default.json` and every opt-in preset.

```shell
make validate
```

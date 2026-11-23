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

It extends `config:recommended` and `schedule:weekly`, enables the nix manager, runs daily lock file maintenance for every manager, and adds regex managers for `.versions/*` files and `dprint-version` workflow inputs.

## Nix repos

A Nix repo extends `nix-ci` after the default preset, and a repo whose `main` deploys also extends `deploys` after `nix-ci`:

```json
{
	"extends": [
		"github>UnstoppableMango/renovate-config",
		"github>UnstoppableMango/renovate-config:nix-ci",
		"github>UnstoppableMango/renovate-config:deploys"
	]
}
```

`nix-ci` opens four kinds of PR, all on Monday before 6 AM America/Chicago: `flake.lock` maintenance, all other lock file maintenance, all non-major updates, and each major on its own.
Updates wait 3 days after release.
Vulnerability alert PRs skip both the wait and the schedule.
Lock file maintenance and flake inputs, which have no release date, do not wait.
Branches are rebased only when they conflict.
Everything but majors automerges through GitHub's auto-merge once required checks pass.
Commits from the `renovate-fixup` App do not stop Renovate updating a branch, and the `renovate:needs-human` label does.

`deploys` turns automerge off for updates that deploy, moving them into their own non-major group, while `flake.lock`, GitHub Actions, workflow pins, and `devDependencies` still automerge.
Order matters: extended before `nix-ci`, its groups are overwritten.

Drop per-repo schedules, such as a monthly `schedule`, when adopting `nix-ci`; it owns the schedule.

## Opt-in presets

Add any of these to `extends` alongside the default preset.

| Preset                                                                 | Purpose                                                                                                                                                  |
| ---------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `github>UnstoppableMango/renovate-config:release-please`               | Commits dependency updates as `deps:` so release-please cuts a release. GitHub Actions pins stay `chore(deps):`.                                         |
| `github>UnstoppableMango/renovate-config:nix-comments`                 | Updates `.nix` values that have a `# renovate: datasource=... depName=...` comment on the line above. Adjacent hashes are not refreshed.                 |
| `github>UnstoppableMango/renovate-config:pulumi-yaml`                  | Updates `Pulumi.yaml` values that have a `# renovate:` comment on the line above.                                                                        |
| `github>UnstoppableMango/renovate-config:gomod2nix(nix)`               | Regenerates `gomod2nix.toml` in the given directory after a Go module update. Needs the command in the self-hosted `allowedCommands`.                    |
| `github>UnstoppableMango/renovate-config:nuget2nix(./tools/nugetdeps)` | Runs the given Go command after a NuGet update to regenerate the `nugetDeps` lock (`deps.json`). Needs the command in the self-hosted `allowedCommands`. |
| `github>UnstoppableMango/renovate-config:automerge`                    | Automerges non-major updates once every status check passes. Extend it only where CI enforces a coverage policy. Nix repos use `nix-ci` instead.         |

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

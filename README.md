# UnstoppableMango's Renovate Presets

[Shareable Config Presets](https://docs.renovatebot.com/config-presets/#github-hosted-presets) for renovate stuff I find myself copy-pasting everywhere.

## Usage

To use the [default](./default.json) preset:

```json
{
	"extends": ["github>UnstoppableMango/renovate-config"]
}
```

## Development

Run `renovate-config-validator` against `default.json`

```shell
make validate
```

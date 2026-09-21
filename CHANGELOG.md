# Changelog

## [1.0.0](https://github.com/UnstoppableMango/renovate-config/compare/v1.0.0...v1.0.0) (2026-09-21)


### Continuous Integration

* use unmango/actions setup-nix ([#46](https://github.com/UnstoppableMango/renovate-config/issues/46)) ([1615447](https://github.com/UnstoppableMango/renovate-config/commit/16154472bcf1d0271c4e3a1962d69fe77d4c339a))

## 1.0.0 (2026-09-21)


### ⚠ BREAKING CHANGES

* repos without a schedule override move from monthly to weekly updates. Extend schedule:monthly to keep the previous cadence.

### Features

* add nix renovate-comment preset ([#38](https://github.com/UnstoppableMango/renovate-config/issues/38)) ([1215168](https://github.com/UnstoppableMango/renovate-config/commit/12151684f612e15296f19d37d8a739d7fe1b389d))
* add release-please preset ([#37](https://github.com/UnstoppableMango/renovate-config/issues/37)) ([5d9ec98](https://github.com/UnstoppableMango/renovate-config/commit/5d9ec98ed5cbc7d800298fa044dfad24e7360242))
* default to a weekly schedule ([#34](https://github.com/UnstoppableMango/renovate-config/issues/34)) ([58113bb](https://github.com/UnstoppableMango/renovate-config/commit/58113bbffb2e9bf210f6e583a300c4554e106daf))
* enable the nix manager and flake.lock maintenance by default ([#33](https://github.com/UnstoppableMango/renovate-config/issues/33)) ([1dd746c](https://github.com/UnstoppableMango/renovate-config/commit/1dd746c9dcc3d82f45182fca62f47526e8ead2bf))
* track devctl pins and dprint workflow inputs ([#36](https://github.com/UnstoppableMango/renovate-config/issues/36)) ([c84d807](https://github.com/UnstoppableMango/renovate-config/commit/c84d807187d776ecf724295903061ecf66ddd53e))


### Bug Fixes

* reference this repo's own preset by name ([#27](https://github.com/UnstoppableMango/renovate-config/issues/27)) ([ca2bff9](https://github.com/UnstoppableMango/renovate-config/commit/ca2bff9331b751b0e4520a7520cd1c14d589057e)), closes [#24](https://github.com/UnstoppableMango/renovate-config/issues/24)
* reference this repo's preset by name again ([#40](https://github.com/UnstoppableMango/renovate-config/issues/40)) ([38aee5a](https://github.com/UnstoppableMango/renovate-config/commit/38aee5a5df126babfef4afee61428b0c51e6c48d))


### Documentation

* document the default and opt-in presets ([#39](https://github.com/UnstoppableMango/renovate-config/issues/39)) ([96fe393](https://github.com/UnstoppableMango/renovate-config/commit/96fe393ca9b7abeb3b4625c5c871e90d2bb5304a))


### Continuous Integration

* configure release-please ([#42](https://github.com/UnstoppableMango/renovate-config/issues/42)) ([7988d83](https://github.com/UnstoppableMango/renovate-config/commit/7988d83cd86988ab17d97a118d0146139c106f43))
* validate every preset ([#32](https://github.com/UnstoppableMango/renovate-config/issues/32)) ([8e4bfde](https://github.com/UnstoppableMango/renovate-config/commit/8e4bfdeb71cdbc3695f4c9679641bb403c27948b))

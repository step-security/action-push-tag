# Action Push Tag

[![release][release-badge]][release]
[![license][license-badge]][license]

This is a GitHub Action to push a Git tag.

It would be more useful to use this with other GitHub Actions' outputs.

## Inputs

|   NAME    |        DESCRIPTION         |   TYPE   | REQUIRED | DEFAULT |
| --------- | -------------------------- | -------- | -------- | ------- |
| `tag`     | A Git tag name.            | `string` | `true`   | `N/A`   |
| `message` | A message for the Git tag. | `string` | `false`  | `''`    |

## Example

```yaml
name: Push a new tag with minor update

on:
  push:
    branches:
      - master

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v6

      - uses: actions-ecosystem/action-get-latest-tag@v1
        id: get-latest-tag

      - uses: actions-ecosystem/action-bump-semver@v1
        id: bump-semver
        with:
          current_version: ${{ steps.get-latest-tag.outputs.tag }}
          level: minor

      - uses: step-security/action-push-tag@v1
        with:
          tag: ${{ steps.bump-semver.outputs.new_version }}
          message: '${{ steps.bump-semver.outputs.new_version }}: PR #${{ github.event.pull_request.number }} ${{ github.event.pull_request.title }}'
```
<!-- badge links -->

[actions-workflow-lint]: https://github.com/step-security/action-push-tag/actions?query=workflow%3ALint
[actions-workflow-lint-badge]: https://img.shields.io/github/workflow/status/step-security/action-push-tag/Lint?label=Lint&style=for-the-badge&logo=github

[release]: https://github.com/step-security/action-push-tag/releases
[release-badge]: https://img.shields.io/github/v/release/step-security/action-push-tag?style=for-the-badge&logo=github

[license]: LICENSE
[license-badge]: https://img.shields.io/github/license/actions-ecosystem/action-add-labels?style=for-the-badge

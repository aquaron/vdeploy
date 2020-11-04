# @aquaron/vdeploy [![badge-build]][vdeploy] ![badge-vdeploy]

Automate versioning (and changelogs) when a release is created.

## Use
```sh
$ vdeploy
```
That's it! It'll walk you through the setup process the first time.
You will need to edit `.github/workflows/vdeploy.yml` to match your release process.
See this package's [vdeploy.yml] to get an idea how to set one up for your project.

### Process
- Install the `vdeploy.yml` and `incr-version.sh` in the right places
- Checks for outstanding PR and merge them (requires GitHub CLI)
- Update `CHANGELOG.md` from commit log (you can editable, vim)
- Create a release  with the next version number as tag and title (editable)


## Files

### `.github/workflows/vdeploy.yml`

When a release is created:
- Triggers deployment workflow (see the file)
- Increment `package.json`'s _minor_ `version`
- Create a PR of the modified `package.json`

### `.github/scripts/incr-version.sh`

Increment the version number _minor_ based on what was just released.

[vdeploy.yml]: https://github.com/aquaron/vdeploy/blob/master/.github/workflows/vdeploy.yml
[badge-build]: https://github.com/aquaron/vdeploy/workflows/NPM%20Package/badge.svg
[vdeploy]: https://www.npmjs.com/package/@aquaron/vdeploy
[badge-vdeploy]: https://img.shields.io/npm/v/@aquaron/vdeploy?label=vdeploy&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA4MDAgODAwIj48cGF0aCBmaWxsPSIjMzMzIiBkPSJNODAwIDQwMEE0MDAgNDAwIDAgMDA0MDAgMCA0MDAgNDAwIDAgMDAwIDQwMGE0MDAgNDAwIDAgMDA0MDAgNDAwIDQwMCA0MDAgMCAwMDQwMC00MDB6Ii8+PHBhdGggZmlsbD0iI2ZmZGU3NSIgZD0iTTQwMCAxMTMuNmMtNTUuNSAxNjUuMy0yMDkuNiAyMTUtMjA5LjYgMzc5LjIgMCAxMDcgMTAyLjcgMTkzLjYgMjA5LjYgMTkzLjYgMTA2LjcgMCAyMDkuNi04Ni43IDIwOS42LTE5My42IDAtMTU5LjItMTQ0LTIxMC43LTIwOS42LTM3OS4yem0wIDUzMi41Yzg0LjUtMTM5LjctNTMuMy0zMzYuNSAxLjMtNDQwIDI0LjggNDAgNTIuNiA3My4xIDc4LjIgMTAzLjggNTAuMSA1OS43IDg5LjggMTA2LjYgODkuOCAxODIuOSAwIDgwLTgwLjggMTUzLjMtMTY5LjMgMTUzLjN6Ii8+PHBhdGggZD0iTTQwMCAwdjIwOC41Yy0xOS4zIDM5LjQtMTIgOTEuNyAwIDE0OSAxOS43IDk0LjQgNTIuMiAyMDIuMyAwIDI4OC41djE1NGE0MDAgNDAwIDAgMDA0MDAtNDAwQTQwMCA0MDAgMCAwMDQwMCAweiIgb3BhY2l0eT0iLjUiLz48L3N2Zz4K&color=ffde75

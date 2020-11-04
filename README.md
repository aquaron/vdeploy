# @aquaron/vdeploy

Automate versioning (and changelogs) when a release is created.

## Use
```sh
$ vdeploy
```
That's it! It'll walk you through the setup process the first time.
You will need to edit `.github/workflows/vdeploy.yml` to match your release process.
(See this package's version of the file to get an idea).

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

## `.github/scripts/incr-version.sh`

Increment the version number _minor_ based on what was just released.

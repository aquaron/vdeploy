# @aquaron/vdeploy

Automate version increment when a release is created.

## `.github/workflows/vdeploy.yml`

When a release is created:
- Triggers deployment workflow
- Increment `package.json`'s micro `version`
- Create a PR of the modified `package.json`

## `.github/scripts/incr-version.sh`

Increment the version number based on what was just released.

## `vdeploy`

- Install the above scripts in the right places
- Checks for outstanding PR and merge them
- Update `CHANGELOG.md` from commit log (editable)
- Create a release (requires GitHub CLI) with the next version number

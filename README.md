**This repo is a temporary solutuion for reusable device types info used in the API (-> UI) and other parts of the system. It meant to be replaced by something easier to manage.**

## Updating Device Types

The current process for making changes and propagating them to other repos is:

* make your changes to the source files (`device-types` folder, or the `build.coffee` script) in a separate branch and send a PR
* once it's approved merge the PR
* checkout the master branch on your machine and pull your recent changes
* run `npm run prepublish`, also open the `package.json` file and bump the package version there (normally bump minor for new features, patch for small fixes, and major for serious refactoring or breaking changes)
* commit your changes (yes, to master): `git commit -am "version bump"`
* tag your changes: `git tag v2.x.x` (substitute with the actual version)
* push your changes and the tag (yes, to master): `git push; git push --tags`
* go to individual systems repos (like resin-api) and bump the required `resin-device-types` version in their `package.json`, send individual PRs to that repos

## Device Instructions

There are some common steps shared across different device types. They are defined in `build.coffee` (`SHARED_INSTRUCTIONS_STEPS`). Check `device-types/raspberry-pi.coffee` for sample usage.

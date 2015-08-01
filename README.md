**This repo holds the reusable device types info used in the API (-> UI) and other parts of the system.**

## Updating Device Types

The current process for making changes and propagating them to other repos is:

* have `node` and `npm` installed, run `npm install` in the repo
* make your changes to the source files (`device-types` folder, or the `build.coffee` script) in a separate branch. See https://resinio.atlassian.net/wiki/display/RES/Adding+device+types+definitions for instructions
* verify your changes by running `npm run prepublish`, you should get no errors and an updated JSOP
* send a PR _but don't include the `device-types.json` in it_, once the PR is approved merge it
* checkout the `master` branch on your machine and pull your recent changes
* run `npm run prepublish`, also open the `package.json` file and bump the package version there (normally bump minor for new features, patch for small fixes, and major for serious refactoring or breaking changes), as well as update the CHANGELOG.md
* commit your changes (yes, to master): `git commit -am "version bump"`
* tag your changes: `git tag v2.x.x` (substitute with the actual version)
* push your changes and the tag (yes, to master): `git push; git push --tags`
* go to individual systems repos (like resin-api) and bump the required `resin-device-types` version in their `package.json`, send individual PRs to that repos

## Device Instructions

There are some common steps shared across different device types. They are defined in `build.coffee` (`SHARED_INSTRUCTIONS_STEPS`). Check `device-types/raspberry-pi.coffee` for sample usage.

## Extra Options

Device type can declare extra options needed for the Image Maker.

Options are declared as an array of definitions that partially conform to the [Inquirer.js](https://github.com/SBoudrias/Inquirer.js/) format.

The following option types are recognized at the moment:

* input _(default)_,
* list,
* confirm.

Each client treats these types differently. For example, Web UI renders `list` as a drop-down and `confirm` as a checkbox.

The following attributes are supported:

* `type` – as defined above,
* `name` — the name of the parameter as it's sent to the Image Maker,
* `message` — the question / label shown in the UI,
* `choices` — _for list only_; an array of strings that are possible choices.

For **confirm** input type the client _should not send any value_ if the question got negative answer (checkbox is unchecked in the UI, or "No" is answered in the CLI), and should send `1` or `true` otherwise. This behaviour could be done more robust (support `0` and `false`), but that should be changed on the Image Maker side.

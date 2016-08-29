**This repo holds the common bits used to compose the resin device types info.**

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

For **confirm** input type the client _should not send any value_ if the question got negative answer (checkbox is unchecked in the UI, or "No" is answered in the CLI), and should send `1` or `true` otherwise. This behavior could be done more robust (support `0` and `false`), but that should be changed on the Image Maker side.

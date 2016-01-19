networkOptions = require '../common/network-options'
common = require '../common/common-img'

module.exports =
	name: 'Technologic ts7700'
	arch: 'armv5e'
	state: 'experimental'

	instructions: common.instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-7700.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-7700.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-7700.md#on-mac-and-linux'

	supportsBlink: false

	yocto:
		machine: 'pxa16'
		image: 'resin-image'
		fstype: 'resin-sdcard'
		version: 'yocto-fido'
		deployArtifact: 'resin-image-pxa16.resin-sdcard'

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

	initialization: common.initialization

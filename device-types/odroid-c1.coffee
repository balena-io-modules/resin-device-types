networkOptions = require '../common/network-options'
common = require '../common/common-img'

module.exports =
	aliases: [ 'odroid-c1' ]
	name: 'ODROID-C1+'
	arch: 'armv7hf'
	state: 'preview'

	instructions: common.instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-ODROID-C1.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-ODROID-C1.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-ODROID-C1.md#on-mac-and-linux'
	supportsBlink: false

	options: [ networkOptions.group ]

	yocto:
		machine: 'odroid-c1'
		image: 'resin-image'
		fstype: 'resin-sdcard'
		version: 'yocto-fido'
		deployArtifact: 'resin-image-odroid-c1.resin-sdcard'

	configuration:
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

	initialization: common.initialization

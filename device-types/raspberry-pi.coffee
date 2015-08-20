networkOptions = require '../common/network-options'
common = require '../common/common-img'

module.exports =
	aliases: [ 'raspberrypi' ]
	name: 'Raspberry Pi'
	arch: 'rpi'
	state: 'released'

	instructions: common.instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#on-mac-and-linux'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi'
		image: 'resin-image'
		fstype: 'resin-sdcard'
		version: 'yocto-fido'
		deployArtifact: 'resin-image-raspberrypi.resin-sdcard'

	configuration:
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

	initialization: common.initialization

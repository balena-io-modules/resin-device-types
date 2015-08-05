networkOptions = require '../common/network-options'

module.exports =
	aliases: [ 'raspberrypi2' ]
	name: 'Raspberry Pi 2'
	arch: 'armv7hf'
	state: 'released'
	isDefault: true

	instructions: require('../common/common-img').instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#on-mac-and-linux'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'raspberrypi2'
		image: 'resin-image'
		fstype: 'resin-sdcard'
		version: 'yocto-fido'
		deployArtifact: 'resin-image-raspberrypi2.resin-sdcard'

	configuration:
		configPartition:
			primary: 4
			logical: 1

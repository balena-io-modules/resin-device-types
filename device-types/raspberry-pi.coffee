networkOptions = require '../common/network-options'

module.exports =
	aliases: [ 'raspberrypi' ]
	name: 'Raspberry Pi'
	arch: 'rpi'
	state: 'released'

	instructions: require('../common/common-img').instructions
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
		configPartition: '(4:1)'

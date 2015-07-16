module.exports =
	aliases: [ 'raspberrypi2' ]
	name: 'Raspberry Pi 2'
	arch: 'armv7hf'
	state: 'released'
	isDefault: true

	configPartition: '4:1'

	instructions: require('../common/common-img').instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#on-mac-and-linux'
	supportsBlink: true

	yocto:
		machine: 'raspberrypi2'
		image: 'resin-image'
		fstype: 'resin-sdcard'

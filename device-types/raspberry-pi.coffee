module.exports =
	aliases: [ 'raspberrypi' ]
	name: 'Raspberry Pi'
	arch: 'rpi'
	state: 'released'

	configPartition: '4:1'

	instructions: require('../common/common-img').instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted.md#on-mac-and-linux'
	supportsBlink: true

	yocto:
		machine: 'raspberrypi'
		image: 'resin-image'
		fstype: 'resin-sdcard'

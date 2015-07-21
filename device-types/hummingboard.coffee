module.exports =
	aliases: [ 'cubox-i' ]
	name: 'Hummingboard'
	arch: 'armv7hf'
	state: 'preview'

	configPartition: '4:1'

	instructions: require('../common/common-img').instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-Hummingboard.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-Hummingboard.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-Hummingboard.md#on-mac-and-linux'
	supportsBlink: false

	yocto:
		machine: 'cubox-i'
		image: 'resin-image'
		fstype: 'resin-sdcard'
		version: 'yocto-fido'

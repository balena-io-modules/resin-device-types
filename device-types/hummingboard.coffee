networkOptions = require '../common/network-options'

module.exports =
	aliases: [ 'cubox-i' ]
	name: 'Hummingboard'
	arch: 'armv7hf'
	state: 'experimental'

	instructions: require('../common/common-img').instructions
	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-Hummingboard.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-Hummingboard.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-Hummingboard.md#on-mac-and-linux'
	supportsBlink: false

	options: [ networkOptions.group ]

	yocto:
		machine: 'cubox-i'
		image: 'resin-image'
		fstype: 'resin-sdcard'
		version: 'yocto-fido'
		deployArtifact: 'resin-image-cubox-i.resin-sdcard'

	configuration:
		configPartition:
			primary: 4
			logical: 1

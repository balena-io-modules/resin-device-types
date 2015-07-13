module.exports =
	name: 'Raspberry Pi 2'
	arch: 'armv7hf'
	state: 'released'
	isDefault: true

	configPartition: '4:1'

	instructions: require('./_common-img').instructions
	gettingStartedLink: 'http://docs.resin.io/#/pages/installing/gettingStarted.md'
	supportsBlink: true

	yocto:
		machine: 'raspberrypi2'
		image: 'resin-image'
		fstype: 'resin-sdcard'

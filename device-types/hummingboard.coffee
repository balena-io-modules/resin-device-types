module.exports =
	name: 'Hummingboard'
	arch: 'armv7hf'
	state: 'experimental'

	configPartition: '4:1'

	instructions: require('./_common-img').instructions
	gettingStartedLink: 'http://docs.resin.io/#/pages/installing/gettingStarted-Hummingboard.md'
	supportsBlink: false

	yocto:
		machine: 'cubox-i'
		image: 'resin-image'
		fstype: 'resin-sdcard'

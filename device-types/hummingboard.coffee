module.exports =
	name: 'Hummingboard'
	arch: 'armv7hf'
	state: 'experimental'

	configPartition: '4:1'

	instructions: [
		'BURN_IMAGE'
		'EJECT'
		'CONNECT_AND_BOOT'
	]
	gettingStartedLink: 'http://docs.resin.io/#/pages/installing/gettingStarted-Hummingboard.md'
	supportsBlink: false

	yocto:
		machine: 'cubox-i'
		image: 'resin-image'
		fstype: 'resin-sdcard'

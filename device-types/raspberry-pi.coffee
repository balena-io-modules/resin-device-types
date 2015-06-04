module.exports =
	name: 'Raspberry Pi'
	arch: 'rpi'
	state: 'released'

	configPartition: '4:1'

	instructions: [
		'BURN_IMAGE'
		'EJECT'
		'CONNECT_AND_BOOT'
	]
	gettingStartedLink: 'http://docs.resin.io/#/pages/installing/gettingStarted.md'
	supportsBlink: true

	yocto:
		machine: 'raspberrypi'
		image: 'resin-image'
		fstype: 'resin-sdcard'

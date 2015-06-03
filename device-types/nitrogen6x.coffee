module.exports =
	name: 'Nitrogen 6X'
	arch: 'armv7hf'
	state: 'preview'

	configPartition: '4:1'

	instructions: [
		'BURN_IMAGE'
		'EJECT'
		'CONNECT_AND_BOOT'
	]
	gettingStartedLink: 'http://docs.resin.io/#/pages/installing/gettingStarted-Nitrogen6x.md'
	supportsBlink: false

	yocto:
		machine: 'nitrogen6x'
		image: 'resin-image'
		fstype: 'resin-sdcard'

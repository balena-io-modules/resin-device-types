module.exports =
	name: 'Nitrogen 6X'
	arch: 'armv7hf'
	state: 'experimental'

	configPartition: '4:1'

	instructions: require('./_common-img').instructions
	gettingStartedLink: 'http://docs.resin.io/#/pages/installing/gettingStarted-Nitrogen6x.md'
	supportsBlink: false

	yocto:
		machine: 'nitrogen6x'
		image: 'resin-image'
		fstype: 'resin-sdcard'

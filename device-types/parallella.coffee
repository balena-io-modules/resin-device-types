module.exports =
	name: 'Parallella'
	arch: 'armv7hf'
	state: 'experimental'

	instructions: [
		'BURN_IMAGE'
		'EJECT'
		'CONNECT_AND_BOOT'
	]
	gettingStartedLink: 'http://docs.resin.io/#/pages/installing/gettingStarted-Parallella.md'
	supportsBlink: true

	extraOptions: [
		message: 'Processor'
		name: 'processorType'
		type: 'list'
		choices: [ 'Z7010', 'Z7020' ]
	,
		message: 'Coprocessor cores'
		name: 'coprocessorCore'
		type: 'list'
		choices: [ '16', '64' ]
	]

	yocto:
		machine: 'parallella-hdmi-resin'
		image: 'resin-image'
		fstype: 'resin-sdcard'

module.exports =
	name: 'BeagleBone Black'
	arch: 'armv7hf'
	state: 'released'

	instructions: [
		'BURN_IMAGE'
		'EJECT'
		'CONNECT'
		'Power up the BBB while holding down the small button near the SD slot.
		You need to keep it pressed until the blue LEDs start flashing wildly.'
	]
	gettingStartedLink: 'http://docs.resin.io/#/pages/gettingStarted-BBB.md'
	supportsBlink: true

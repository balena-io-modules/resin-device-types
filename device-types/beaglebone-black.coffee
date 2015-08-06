networkOptions = require '../common/network-options'

BBB_FLASH = 'Power up the <%= TYPE_NAME %> while holding down the small button near the SD slot.
You need to keep it pressed until the blue LEDs start flashing wildly.'

module.exports =
	aliases: [ 'beaglebone' ]
	name: 'BeagleBone Black'
	arch: 'armv7hf'
	state: 'released'

	instructions:
		windows: [
			'WINDOWS_DISK_IMAGER'
			'EJECT'
			BBB_FLASH
		]
		osx: [
			'OSX_PLUG'
			'OSX_UNMOUNT'
			'DD_BURN_IMAGE'
			'EJECT'
			BBB_FLASH
		]
		linux: [
			'LINUX_DF'
			'DD_BURN_IMAGE'
			'EJECT'
			BBB_FLASH
		]

	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-BBB.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-BBB.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-BBB.md#on-mac-and-linux'

	supportsBlink: true

	yocto:
		machine: 'beaglebone'
		image: 'resin-image-flasher'
		fstype: 'resin-sdcard'
		version: 'yocto-fido'
		deployArtifact: 'resin-image-flasher-beaglebone.resin-sdcard'

	options: [ networkOptions.group ]

	configuration:
		configPartition:
			primary: 4
			logical: 1

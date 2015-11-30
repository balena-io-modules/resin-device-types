networkOptions = require '../common/network-options'
common = require '../common/common-img'

BBB_FLASH = 'Power up the <%= TYPE_NAME %> while holding down the small button near the SD slot.
You need to keep it pressed until the blue LEDs start flashing wildly.'

BBB_REPOWER = 'Remove and re-connect power to the board.'

module.exports =
	aliases: [ 'beaglebone' ]
	name: 'BeagleBone Black'
	arch: 'armv7hf'
	state: 'released'

	stateInstructions:
		postProvisioning: [
			'BOARD_SHUTDOWN'
			'REMOVE_INSTALL_MEDIA'
			BBB_REPOWER
		]

	instructions:
		windows: [
			'WINDOWS_DISK_IMAGER_SD'
			'EJECT_SD'
			BBB_FLASH
			'FLASHER_WARNING'
		]
		osx: [
			'OSX_PLUG_SD'
			'OSX_UNMOUNT_SD'
			'DD_BURN_IMAGE_SD'
			'EJECT_SD'
			BBB_FLASH
			'FLASHER_WARNING'
		]
		linux: [
			'LINUX_DF_SD'
			'DD_BURN_IMAGE_SD'
			'EJECT_SD'
			BBB_FLASH
			'FLASHER_WARNING'
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
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

	initialization: common.initialization

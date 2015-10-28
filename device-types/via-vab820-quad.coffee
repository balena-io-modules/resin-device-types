networkOptions = require '../common/network-options'
common = require '../common/common-img'

BOARD_SHUTDOWN_VIA = 'The device is performing a shutdown. Please wait until the device is offline in the dashboard and disconnect the power cable.'
SET_JUMPER_SD = 'Set J11 (just next to the micro SD card slot) to position 2-3 (the position furthest away from the edge of the board) and then power on the board.'
SET_JUMPER_EMMC = 'Set J11 (just next to the micro SD card slot) to position 1-2 (the position closest to the edge of the board).'
VIA_REPOWER = 'Re-connect power to the board.'

module.exports =
	aliases: [ 'vab820-quad' ]
	name: 'VIA VAB 820-quad'
	arch: 'armv7hf'
	state: 'preview'

	stateInstructions:
		postProvision: [
			BOARD_SHUTDOWN_VIA
			'REMOVE_INSTALL_MEDIA'
			SET_JUMPER_EMMC
			VIA_REPOWER
		]

	instructions:
		windows: [
			'WINDOWS_DISK_IMAGER'
			'EJECT'
			SET_JUMPER_SD
		]
		osx: [
			'OSX_PLUG'
			'OSX_UNMOUNT'
			'DD_BURN_IMAGE'
			'EJECT'
			SET_JUMPER_SD
		]
		linux: [
			'LINUX_DF'
			'DD_BURN_IMAGE'
			'EJECT'
			SET_JUMPER_SD
		]

	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-VIA-VAB820.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-VIA-VAB820.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-VIA-VAB820.md#on-mac-and-linux'

	supportsBlink: false

	yocto:
		machine: 'vab820-quad'
		image: 'resin-image-flasher'
		fstype: 'resin-sdcard'
		version: 'yocto-fido'
		deployArtifact: 'resin-image-flasher-vab820-quad.resin-sdcard'

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

	initialization: common.initialization

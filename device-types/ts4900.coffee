networkOptions = require '../common/network-options'
common = require '../common/common-img'

TS_EMMC_BOOT_SELECT = 'Disable the SD boot jumper present on your specifc base board.'

TS_SD_BOOT_SELECT = 'Enable the SD boot jumper present on your specifc base board.'

TS_REPOWER = 'Remove and re-connect power to the board.'

module.exports =
	name: 'Technologic TS-4900'
	arch: 'armv7hf'
	state: 'experimental'

	stateInstructions:
		postProvisioning: [
			'BOARD_SHUTDOWN'
			'REMOVE_INSTALL_MEDIA'
			TS_EMMC_BOOT_SELECT
			TS_REPOWER	
		]

	instructions:
		windows: [
			'WINDOWS_DISK_IMAGER'
			'EJECT'
			TS_SD_BOOT_SELECT
			'FLASHER_WARNING'
		]
		osx: [
			'OSX_PLUG'
			'OSX_UNMOUNT'
			'DD_BURN_IMAGE'
			'EJECT'
			TS_SD_BOOT_SELECT
			'FLASHER_WARNING'
		]
		linux: [
			'LINUX_DF'
			'DD_BURN_IMAGE'
			'EJECT'
			TS_SD_BOOT_SELECT
			'FLASHER_WARNING'
		]


	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-4900.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-4900.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-TS-4900.md#on-mac-and-linux'

	supportsBlink: false

	yocto:
		machine: 'ts4900'
		image: 'resin-image-flasher'
		fstype: 'resin-sdcard'
		version: 'yocto-fido'
		deployArtifact: 'resin-image-flasher-ts4900.resin-sdcard'

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

	initialization: common.initialization

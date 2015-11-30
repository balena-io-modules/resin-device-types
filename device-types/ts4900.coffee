networkOptions = require '../common/network-options'
common = require '../common/common-img'

TS_EMMC_BOOT_SELECT = 'Disable the SD boot jumper present on your specifc base board.'

TS_SD_BOOT_SELECT = 'Enable the SD boot jumper present on your specifc base board.'

module.exports =
	name: 'Technologic TS-4900'
	arch: 'armv7hf'
	state: 'experimental'

	stateInstructions:
		postProvisioning: [
			'BOARD_SHUTDOWN'
			'REMOVE_INSTALL_MEDIA'
			TS_EMMC_BOOT_SELECT
			'BOARD_REPOWER'
		]

	instructions:
		windows: [
			'WINDOWS_DISK_IMAGER_SD'
			'EJECT_SD'
			'FLASHER_WARNING'
			TS_SD_BOOT_SELECT
			'BOARD_SHUTDOWN'
			'REMOVE_INSTALL_MEDIA'
			TS_EMMC_BOOT_SELECT
			'BOARD_REPOWER'
		]
		osx: [
			'OSX_PLUG_SD'
			'OSX_UNMOUNT_SD'
			'DD_BURN_IMAGE_SD'
			'EJECT_SD'
			'FLASHER_WARNING'
			TS_SD_BOOT_SELECT
			'BOARD_SHUTDOWN'
			'REMOVE_INSTALL_MEDIA'
			TS_EMMC_BOOT_SELECT
			'BOARD_REPOWER'
		]
		linux: [
			'LINUX_DF_SD'
			'DD_BURN_IMAGE_SD'
			'EJECT_SD'
			'FLASHER_WARNING'
			TS_SD_BOOT_SELECT
			'BOARD_SHUTDOWN'
			'REMOVE_INSTALL_MEDIA'
			TS_EMMC_BOOT_SELECT
			'BOARD_REPOWER'
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

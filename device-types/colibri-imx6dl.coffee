networkOptions = require '../common/network-options'
common = require '../common/common-img'

SERIAL_CABLE = 'Connect the carrier board to a host computer using a serial cable. (This step may differ based on what carrier board you have)'
UBOOT = 'Power the module. Press SPACE when prompted by U-Boot to stop execution and run the following command `run sdboot`'

module.exports =
	name: 'Colibri iMX6dl'
	arch: 'armv7hf'
	state: 'experimental'

	instructions:
		windows: [
			'WINDOWS_DISK_IMAGER'
			'EJECT'
			SERIAL_CABLE
			UBOOT
		]
		osx: [
			'OSX_PLUG'
			'OSX_UNMOUNT'
			'DD_BURN_IMAGE'
			'EJECT'
			SERIAL_CABLE
			UBOOT
		]
		linux: [
			'LINUX_DF'
			'DD_BURN_IMAGE'
			'EJECT'
			SERIAL_CABLE
			UBOOT
		]

	gettingStartedLink:
		windows: 'http://docs.resin.io/#/pages/installing/gettingStarted-colibri-imx6.md#windows'
		osx: 'http://docs.resin.io/#/pages/installing/gettingStarted-colibri-imx6.md#on-mac-and-linux'
		linux: 'http://docs.resin.io/#/pages/installing/gettingStarted-colibri-imx6.md#on-mac-and-linux'

	supportsBlink: false

	yocto:
		machine: 'colibri-imx6'
		image: 'resin-image-flasher'
		fstype: 'resin-sdcard'
		version: 'yocto-fido'
		deployArtifact: 'resin-image-flasher-colibri-imx6.resin-sdcard'

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 4
				logical: 1
			path: '/config.json'

	initialization: common.initialization

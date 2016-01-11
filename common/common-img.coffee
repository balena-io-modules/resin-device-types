commonInstructions = require './instructions'

exports.instructions =
	windows: [
		commonInstructions.WINDOWS_DISK_IMAGER_SD
		commonInstructions.EJECT_SD
		commonInstructions.CONNECT_AND_BOOT
	]

	osx: [
		commonInstructions.OSX_PLUG_SD
		commonInstructions.OSX_UNMOUNT_SD
		commonInstructions.DD_BURN_IMAGE_SD
		commonInstructions.EJECT_SD
		commonInstructions.CONNECT_AND_BOOT
	]

	linux: [
		commonInstructions.LINUX_DF_SD
		commonInstructions.DD_BURN_IMAGE_SD
		commonInstructions.EJECT_SD
		commonInstructions.CONNECT_AND_BOOT
	]

exports.initialization =
	options: [
		message: 'Select a drive'
		type: 'drive'
		name: 'drive'
	]

	operations: [
		command: 'burn'
	]

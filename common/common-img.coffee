commonInstructions = require './instructions'

exports.instructions =
	windows: [
		commonInstructions.WINDOWS_ETCHER_SD
		commonInstructions.EJECT_SD
		commonInstructions.CONNECT_AND_BOOT
	]

	osx: [
		commonInstructions.OSX_ETCHER_SD
		commonInstructions.EJECT_SD
		commonInstructions.CONNECT_AND_BOOT
	]

	linux: [
		commonInstructions.LINUX_ETCHER_SD
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

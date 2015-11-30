exports.instructions =
	windows: [
		'WINDOWS_DISK_IMAGER_SD'
		'EJECT_SD'
		'CONNECT_AND_BOOT'
	]

	osx: [
		'OSX_PLUG_SD'
		'OSX_UNMOUNT_SD'
		'DD_BURN_IMAGE_SD'
		'EJECT_SD'
		'CONNECT_AND_BOOT'
	]

	linux: [
		'LINUX_DF_SD'
		'DD_BURN_IMAGE_SD'
		'EJECT_SD'
		'CONNECT_AND_BOOT'
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

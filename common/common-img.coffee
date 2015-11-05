exports.instructions =
	windows: [
		'WINDOWS_DISK_IMAGER'
		'EJECT'
		'CONNECT_AND_BOOT'
	]

	osx: [
		'OSX_PLUG'
		'OSX_UNMOUNT'
		'DD_BURN_IMAGE'
		'EJECT'
		'CONNECT_AND_BOOT'
	]

	linux: [
		'LINUX_DF'
		'DD_BURN_IMAGE'
		'EJECT'
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

exports.group =
	isGroup: true
	isCollapsible: true
	colapsed: true
	name: 'advanced'
	message: 'Advanced'
	options: [
		message: 'Check for updates every X minutes'
		name: 'appUpdatePollInterval'
		type: 'number'
		min: 0
	]

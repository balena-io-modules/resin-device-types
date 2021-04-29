exports.group =
	isGroup: true
	isCollapsible: true
	collapsed: true
	name: 'advanced'
	message: 'Advanced'
	options: [
		message: 'Check for updates every X minutes'
		name: 'appUpdatePollInterval'
		type: 'number'
		min: 10
		default: 10
	,
		message: 'Device Hostname'
		name: 'hostname'
		type: 'text'
	,
		message: 'Persistent Logging'
		name: 'persistentLogging'
		type: 'confirm'
	,
		message: 'NTP Servers'
		name: 'ntpServers'
		type: 'text'
	,
		message: 'DNS Servers'
		name: 'dnsServers'
		type: 'text'
	,
		message: 'Balena Root CA'
		name: 'balenaRootCA'
		type: 'text'
	]

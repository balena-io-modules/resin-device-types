exports.network = network =
	message: 'Network Connection'
	name: 'network'
	type: 'list'
	choices: [ 'ethernet', 'wifi + ethernet' ]

exports.wifiSsid = wifiSsid =
	message: 'Wifi SSID'
	name: 'wifiSsid'
	type: 'text'
	when:
		network: 'wifi'

exports.wifiKey = wifiKey =
	message: 'Wifi Passphrase'
	name: 'wifiKey'
	type: 'password'
	when:
		network: 'wifi'

exports.options = options = [ network, wifiSsid, wifiKey ]

exports.group =
	isGroup: true
	name: 'network'
	message: 'Network'
	options: options

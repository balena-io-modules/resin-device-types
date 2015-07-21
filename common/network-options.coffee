exports.network = network =
	message: 'Network Connection'
	name: 'network'
	type: 'list'
	choices: [ 'ethernet', 'wifi' ]

exports.wifiSsid = wifiSsid =
	message: 'Wifi SSID'
	name: 'wifiSsid'
	type: 'text'
	when:
		network: 'wifi'

exports.wifiKey = wifiKey =
	message: 'Wifi Passphrase'
	name: 'wifiKey'
	type: 'text'
	when:
		network: 'wifi'

exports.options = [ network, wifiSsid, wifiKey ]

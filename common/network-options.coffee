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
	type: 'password'
	when:
		network: 'wifi'

exports.country = country =
	message: 'Country Code'
	name: 'country'
	type: 'text'
	when:
		network: 'wifi'

exports.options = options = [ network, wifiSsid, wifiKey, country ]

exports.group =
	isGroup: true
	name: 'network'
	message: 'Network'
	options: options

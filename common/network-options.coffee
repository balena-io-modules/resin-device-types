exports.options = [
	message: 'Network Type'
	name: 'network'
	type: 'list'
	choices: [ 'ethernet', 'wifi' ]
,
	message: 'Wifi Ssid'
	name: 'wifiSsid'
	type: 'text'
	when:
		network: 'wifi'
,
	message: 'Wifi Key'
	name: 'wifiKey'
	type: 'text'
	when:
		network: 'wifi'
]

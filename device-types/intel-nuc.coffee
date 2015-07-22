module.exports =
	aliases: [ 'nuc' ]
	name: 'Intel NUC'
	arch: 'amd64'
	state: 'preview'

	yocto:
		machine: 'nuc'
		image: 'resin-image-flasher'
		fstype: 'resin-sdcard'
		version: 'yocto-fido'

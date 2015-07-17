OSX_DFU_COREUTILS_USBUTILS = '''
	You need <a href="https://www.macports.org/">MacPorts</a> installed on your system.
	<br>
	Run the following to install <code>dfu-util</code>, <code>usbutils</code> and <code>coreutils</code>:
	<code>sudo port install dfu-util@0.7 usbutils coreutils && sudo port activate dfu-util@0.7</code>
'''

UNPLUG = 'Unplug the Intel Edison board from your system.'

UNZIP = 'Unzip the downloaded Device OS file.'

OSX_LINUX_FLASH = '''
	Execute the following from the unzipped directory:
	<br>
	<code>sudo ./flashall.sh</code>
'''

PLUG = '''
	Plug the Intel Edison as per the instructions on your terminal.
	<br>
	You can check the progress of the provisioning on your terminal.
'''

WINDOWS_DRIVERS = 'Install Windows drivers for Edison from
	<a href="http://downloadmirror.intel.com/24909/eng/IntelEdisonDriverSetup1.2.1.exe">here</a>'

WINDOWS_FLASH = '''
	Open a terminal with administrative privileges and execute the following from the unzipped directory:
	<br>
	<code>flashall.bat</code>
'''

LINUX_DFU_COREUTILS = '''
	Install <code>dfu-util</code> and <code>coreutils</code> from your distributions repos. For example, for Ubuntu:
	<br>
	<code>apt-get install dfu-util coreutils</code>
'''

module.exports =
	name: 'Intel Edison'
	arch: 'i386'
	state: 'experimental'

	forceNetwork: 'wifi'
	gettingStartedLink: 'http://docs.resin.io/#/pages/installing/gettingStarted-Edison.md'

	instructions:
		osx: [ OSX_DFU_COREUTILS_USBUTILS, UNPLUG, UNZIP, OSX_LINUX_FLASH, PLUG ]
		windows: [ WINDOWS_DRIVERS, UNPLUG, UNZIP, WINDOWS_FLASH, PLUG ]
		linux:  [ LINUX_DFU_COREUTILS, UNPLUG, UNZIP, OSX_LINUX_FLASH, PLUG ]

	yocto:
		machine: 'edison'
		image: 'resin-image'
		deployArtifact: 'resin-edison'
		archive: true

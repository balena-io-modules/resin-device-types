OSX_DFU = '''
	You need either <a href="http://brew.sh/">Homebrew</a> or <a href="https://www.macports.org/">MacPorts</a> installed on your system.
	<br>
	For Homebrew - run the following to install <code>dfu-util</code>:
	<br>
	<code>brew install dfu-util</code>
	<br>
	For MacPorts - run the following to install <code>dfu-util</code>:
	<br>
	<code>sudo port install dfu-util</code>
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
	<a href="http://downloadmirror.intel.com/24698/eng/IntelEdisonDriverSetup1.2.1.exe">here</a>'

WINDOWS_FLASH = '''
	Open a terminal with administrative privileges and execute the following from the unzipped directory:
	<br>
	<code>flashall.bat</code>
'''

LINUX_DFU = '''
	Install <code>dfu-util</code> from your distributions repos. For example, for Ubuntu:
	<br>
	<code>apt-get install dfu-util</code>
'''

module.exports =
	name: 'Intel Edison'
	arch: 'i386'
	state: 'released'

	forceNetwork: 'wifi'
	gettingStartedLink: 'http://docs.resin.io/#/pages/installing/gettingStarted-Edison.md'

	instructions:
		osx: [ OSX_DFU, UNPLUG, UNZIP, OSX_LINUX_FLASH, PLUG ]
		windows: [ WINDOWS_DRIVERS, UNPLUG, UNZIP, WINDOWS_FLASH, PLUG ]
		linux:  [ LINUX_DFU, UNPLUG, UNZIP, OSX_LINUX_FLASH, PLUG ]

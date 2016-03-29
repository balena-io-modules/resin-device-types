DISK_IMAGER_URL = "http://sourceforge.net/projects/win32diskimager/"

ETCHER_HOME = "http://www.etcher.io/"
ETCHER_BASE_URL = "https://resin-production-downloads.s3.amazonaws.com/etcher"
ETCHER_VERSION = "1.0.0-beta.0"

OSX_ETCHER_URL = "#{ETCHER_BASE_URL}/#{ETCHER_VERSION}/Etcher-darwin-x64.dmg"
LINUX_X86_ETCHER_URL = "#{ETCHER_BASE_URL}/#{ETCHER_VERSION}/Etcher-linux-x86.tar.gz"
LINUX_X64_ETCHER_URL = "#{ETCHER_BASE_URL}/#{ETCHER_VERSION}/Etcher-linux-x64.tar.gz"
WINDOWS_X86_ETCHER_URL = "#{ETCHER_BASE_URL}/#{ETCHER_VERSION}/Etcher-win32-x86.exe"
WINDOWS_X64_ETCHER_URL = "#{ETCHER_BASE_URL}/#{ETCHER_VERSION}/Etcher-win32-x64.exe"

OS_NAMES =
	windows: 'Windows'
	osx: 'OS X'
	linux: 'Linux'

OS_ETCHER_DOWNLOADS =
	windows: """
		<a href="#{WINDOWS_X86_ETCHER_URL}">x86</a>,&nbsp;
		<a href="#{WINDOWS_X64_ETCHER_URL}">x64</a>
	"""
	osx: """
		<a href="#{OSX_ETCHER_URL}">.dmg</a>
	"""
	linux: """
		<a href="#{LINUX_X86_ETCHER_URL}">x86</a>,&nbsp;
		<a href="#{LINUX_X64_ETCHER_URL}">x64</a>
	"""

buildEtcherInstructions = (os, medium) ->
	"""
		Download and install Etcher for #{OS_NAMES[os]}
		(#{OS_ETCHER_DOWNLOADS[os]}) (<a href="#{ETCHER_HOME}">see all versions</a>).
		You can also use another image writer of your choice.
		<br>
		Start the writer and select the &lt;OS-image-download&gt;.img (<%= SUBSTITUTE_DOWNLOAD %>) in your download folder.
		<br>
		Insert your #{medium} and press [Burn!].
		<br>
		<strong>Warning!</strong> This will erase your #{medium}, please make sure any important data is backed up.
		<br>
		Wait until it's finished writing.
		<br>
		<strong>Info</strong>: you can repeat the above steps for as many devices as you want, using the same OS image file.
	"""

module.exports =
	CONNECT: 'Connect your device to the internet.'

	CONNECT_AND_BOOT: 'Connect your <%= TYPE_NAME %> to the internet, then power it up.'

	WAIT: 'Your device should appear here in about 10 minutes. Have fun!'

	WINDOWS_DISK_IMAGER_SD: """
		Install <a href="#{DISK_IMAGER_URL}">Win32 Disk Imager</a>.
		<br>
		Start Win32 Disk Imager and navigate to the Device OS <code>.img</code> in your downloads.
		Select &lt;OS-image-download&gt;.img (<%= SUBSTITUTE_DOWNLOAD %>)
		as your “Image File”.'
		<br>
		Insert your SD card. In Win32 Disk Imager, select your SD card in the drop down for “Device”
		<br>
		Make 100% sure it is the correct drive and click “Write”.
		<br>
		<strong>Warning!</strong>: Please make sure you have backed-up your SD card first,
		as this will completely erase the contents of your SD card.
		<br>
		Wait until it's finished writing.
	"""

	WINDOWS_DISK_IMAGER_USB: """
		Install <a href="#{DISK_IMAGER_URL}">Win32 Disk Imager</a>.
		<br>
		Start Win32 Disk Imager and navigate to the Device OS <code>.img</code> in your downloads.
		Select &lt;OS-image-download&gt;.img (<%= SUBSTITUTE_DOWNLOAD %>)
		as your “Image File”.'
		<br>
		Insert your USB key. In Win32 Disk Imager, select your USB key in the drop down for “Device”
		<br>
		Make 100% sure it is the correct drive and click “Write”.
		<br>
		<strong>Warning!</strong>: Please make sure you have backed-up your USB key first,
		as this will completely erase the contents of your USB key.
		<br>
		Wait until it's finished writing.
	"""

	OSX_ETCHER_SD: buildEtcherInstructions('osx', 'SD card'),
	OSX_ETCHER_USB: buildEtcherInstructions('osx', 'USB key'),
	WINDOWS_ETCHER_SD: buildEtcherInstructions('windows', 'SD card'),
	WINDOWS_ETCHER_USB: buildEtcherInstructions('windows', 'USB key'),
	LINUX_ETCHER_SD: buildEtcherInstructions('linux', 'SD card'),
	LINUX_ETCHER_USB: buildEtcherInstructions('linux', 'USB key'),

	LINUX_DF_SD: '''
		Run <code>df -h</code> to see what devices are currently mounted.
		<br>
		Insert your SD card.
		<br>
		Run <code>df -h</code> again,the device that wasn\'t there last time is your SD card.
		It will be listed as something like <code>/dev/mmcblk0p1</code> or <code>/dev/sdd1</code>.
		The last part ("p1" or "1" respectively) is the partition number,
		so the SD should be something like "/dev/mmcblk0" or "/dev/sdd"
		<br>
		Unmount your SD card with <code>umount /dev/mmcblk0pN</code> or <code>umount /dev/sddN</code> where N is your SD card number.
	'''

	LINUX_DF_USB: '''
		Run <code>df -h</code> to see what devices are currently mounted.
		<br>
		Insert your USB key.
		<br>
		Run <code>df -h</code> again,the device that wasn\'t there last time is your USB key.
		It will be listed as something like <code>/dev/mmcblk0p1</code> or <code>/dev/sdd1</code>.
		The last part ("p1" or "1" respectively) is the partition number,
		so the USB should be something like "/dev/mmcblk0" or "/dev/sdd"
		<br>
		Unmount your USB key with <code>umount /dev/sddN</code> where N is your USB key number.
	'''

	EJECT_SD: 'Safely eject the freshly burnt SD card and insert into the <%= TYPE_NAME %>.'
	EJECT_USB: 'Safely eject the freshly burnt USB key and insert into the <%= TYPE_NAME %>.'

	SUBSTITUTE_DOWNLOAD: 'but replacing <code>&lt;OS-image-download&gt;</code> with your download name'

	DD_BURN_IMAGE_SD: '''
		Run <code>sudo dd bs=1m if=~/Downloads/&lt;OS-image-download&gt;.img of=/dev/rdiskN</code>
		<%= SUBSTITUTE_DOWNLOAD %>
		and replacing the <code>of=/dev/rdiskN</code> with the appropriate device name.
		<br>
		<strong>Warning!</strong>&nbsp;Please make sure you have backed-up your SD card first,
		as this will completely erase its contents. You can see a full description of this process
		<a href="<%= GETTING_STARTED_LINK %>">here</a>.
	'''

	DD_BURN_IMAGE_USB: '''
		Run <code>sudo dd bs=1m if=~/Downloads/&lt;OS-image-download&gt;.img of=/dev/rdiskN</code>
		<%= SUBSTITUTE_DOWNLOAD %>
		and replacing the <code>of=/dev/rdiskN</code> with the appropriate device name.
		<br>
		<strong>Warning!</strong>&nbsp;Please make sure you have backed-up your USB key first,
		as this will completely erase its contents. You can see a full description of this process
		<a href="<%= GETTING_STARTED_LINK %>">here</a>.
	'''

	OSX_PLUG_SD: 'Plug your SD card into your computer and in a terminal run <code>diskutil list</code>.
	You should see your SD card as <code>/dev/diskN</code>, (N=1,2,3,4…)'

	OSX_PLUG_USB: 'Plug your USB key into your computer and in a terminal run <code>diskutil list</code>.
	You should see your USB key as <code>/dev/diskN</code>, (N=1,2,3,4…)'

	OSX_UNMOUNT_SD: 'Unmount your SD card with <code>diskutil umountDisk /dev/diskN</code> where N is your SD card number.'

	OSX_UNMOUNT_USB: 'Unmount your USB key with <code>diskutil umountDisk /dev/diskN</code> where N is your USB key number.'

	BOARD_SHUTDOWN: 'The device is performing a shutdown. Please wait until all LEDs are off.'

	BOARD_REPOWER: 'Remove and re-connect power to the board.'

	REMOVE_INSTALL_MEDIA: 'Remove the resin.io installation media.'

	FLASHER_WARNING: '<strong>Warning!</strong> This will also completely erase internal storage media, so please make a backup first.'

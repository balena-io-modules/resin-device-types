exports.instructions =
	CONNECT: 'Connect your device to the internet.'

	CONNECT_AND_BOOT: 'Connect your <%= TYPE_NAME %> to the internet, then power it up.'

	WAIT: 'Your device should appear here in about 10 minutes. Have fun!'

	WINDOWS_DISK_IMAGER: '''
		Install <a href="http://sourceforge.net/projects/win32diskimager/">Win32 Disk Imager</a>.
		<br>
		Start Win32 Disk Imager and navigate to the Device OS <code>.img</code> in your downloads.
		Select &lt;OS-image-download&gt;.img (<%= SUBSTITUTE_DOWNLOAD %>)
		as your “Image File”.'
		<br>
		Insert your SD card. In Win32 Disk Imager, select your SD in the drop down for “Device”
		<br>
		Make 100% sure it is the correct drive and click “Write”.
		<br>
		Wait until it's finished writing.
	'''

	LINUX_DF: '''
		Run <code>df -h</code> to see what devices are currently mounted.
		<br>
		Insert your SD card.
		<br>
		Run <code>df -h</code> again,the device that wasn\'t there last time is your SD card.
		It will be listed as something like <code>/dev/mmcblk0p1</code> or <code>/dev/sdd1</code>.
		The last part ("p1" or "1" respectively) is the partition number,
		so the SD name is without these "/dev/mmcblk0" or "/dev/sdd"
		<br>
		Unmount your SD with <code>umount /dev/sddN</code> <%= SUBSTITUTE_DISK %>.
	'''

	EJECT: 'Safely eject the freshly burnt SD card and insert into the <%= TYPE_NAME %>.'

	SUBSTITUTE_DOWNLOAD: 'but replacing <code>&lt;OS-image-download&gt;</code> with your download name'

	SUBSTITUTE_DISK: 'where N is your SD disk number'

	DD_BURN_IMAGE: '''
		Run <code>sudo dd bs=1m if=~/Downloads/&lt;OS-image-download&gt;.img of=/dev/rdiskN</code>
		<%= SUBSTITUTE_DOWNLOAD %>
		and replacing the <code>of=/dev/rdiskN</code> with the appropriate device name.
		<br>
		<strong>Warning!</strong>&nbsp;This step is dangerous. You can see a full description of this process
		<a href="<%= GETTING_STARTED_LINK %>">here</a>.
	'''

	OSX_PLUG: 'Plug your SD card into your computer and in a terminal run <code>diskutil list</code>.
	You should see your SD card as <code>/dev/diskN</code>, (N=1,2,3,4…)'

	OSX_UNMOUNT: 'Unmount your SD with <code>diskutil umountDisk /dev/diskN</code> <%= SUBSTITUTE_DISK %>.'

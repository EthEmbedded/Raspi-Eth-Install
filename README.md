# Eth(Embedded) Raspberry Pi/[Ethereum](https://www.ethereum.org/) Install Instructions
### Utilizing [Raspbian](http://www.raspbian.org/) Unattended Installer - [ua-netinst](https://github.com/debian-pi/raspbian-ua-netinst)

[Ua-netinst](https://github.com/debian-pi/raspbian-ua-netinst) is a great tool that will install a minimal(no GUI) Debian based Raspbian OS.  It is Raspberry Pi agnostic, therefore there is only one set of instructions to follow, no matter which model of RasPi you have.

### Supported Boards:
  1. Raspberry Pi B (SD Card)
  2. Raspberry Pi B+ (SD Card)
  3. Raspberry Pi 2 (Micro SD Card)
  4. ***May work on "Model A", but has not been tested

### Materials Needed:
- Raspberry Pi development board (one of the models listed above, preferably the RasPi2)
- 64GB micro SD Card(Raspi2) or with SD Adapter(RasPiB/B+).  
	- *Suggestion*: Use Class 10 SanDisk Ultra or Extreme models with higher R/W speeds
- Power Supply for Raspberry Pi(minimum 5VDC 1Amp micro USB)
- Ethernet cable (to connect to available, DHCP enabled, internet router)
  
### Optional Materials:
- HDMI cable
- Monitor with HDMI input(or apropriate adapter)
- USB Keyboard

### Installation Method 
###### *Disclaimer* - If you will be formatting an SD card be aware that you will be deleting all information stored on said card.  Eth(Embedded) is *NOT*  responsible for any data loss that may occur during the format process.

1. Download, unzip and copy the [ua-netinst files](https://github.com/debian-pi/raspbian-ua-netinst/releases/) to your SD card.
2. Download, unzip and copy ONLY the file installer-config.txt from [Raspi-Ethereum-Installv0.1.x](https://github.com/EthEmbedded/Raspi-Eth-Install/releases/) to your SD card
3. Safely remove and install SD card into a powered down Raspberry Pi (1B, 1B+, or 2) with ethernet cable connected between RasPi and an internet enabled DHCP router.
4. Power on your Pi... Make sure there is activity with the RasPi's onboard led's(you should see green led's flashing as well as activity on the ethernet port led's)

	- If you see led's flashing you can walk away...go grab a coffee, or spend some time with your family:)
	- If you do not see led's flashing something may have gone wrong... If this is the case, the only way to truly	diagnose what has happened is to connect a Monitor and Keyboard, and reference the [ua-netinst 				github](https://github.com/debian-pi/raspbian-ua-netinst) for troubleshooting steps.
5. Once ua-netinst is complete, we need to log in to our router and look at the dhcp client list to find the IP address assigned to our device, alternately you can use one of my favorite mobile apps, [FING](https://play.google.com/store/apps/details?id=com.overlook.android.fing&hl=en), as long as your android phone is connected to the same network. We can then, using a linux cli or [putty](http://www.putty.org/), ssh into the device with the following credentials:
	
	- login:	`root`
	- password:	`root`
######At this point, until the next release of ua-netinst(v1.1.x) you may want to add a user other than `root` using `adduser <username> sudo`
6. Log in as `root` or, preferably your new user, and download, unzip, and choose eth-install.sh OR geth-install.sh:

	`wget https://github.com/EthEmbedded/Raspi-Eth-Install/archive/v0.1.0.tar.gz`

	`tar -xvzf v0.1.0.tar.gz`

	`chmod +x eth-install.sh` OR `chmod +x geth-install.sh`
	
7. Now lets run the install script for either `geth` or `eth`

	`./geth-install.sh`
	
	OR
	
	`./eth-install.sh`
	
8. Finally lets start the client:

	For `geth` :
	
	`cd ~/go-ethereum/build/bin`
	
	`./geth`
	
	For `eth`:
	
	`cd ~/cpp-ethereum/build/eth`
	
	`./eth`

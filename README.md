# Eth(Embedded) Raspberry Pi/[Ethereum](https://www.ethereum.org/) Install Instructions
### Utilizing [Raspbian](http://www.raspbian.org/) Unattended Installer - [ua-netinst](https://github.com/debian-pi/raspbian-ua-netinst)

[Ua-netinst](https://github.com/debian-pi/raspbian-ua-netinst) is a great tool that will install a minimal(no GUI) Debian based Raspbian OS.  It is Raspberry Pi agnostic, therefore there is only one set of instructions to follow, no matter which model of RasPi you have.

### Supported Boards:
  1. Raspberry Pi B (SD Card)
  2. Raspberry Pi B+ (SD Card)
  3. Raspberry Pi 2 (Micro SD Card)
  4. ***May work on "Model A", but has not been tested

### Materials Needed:
- Raspberry Pi development board (one of the models listed above)
- 32GB micro SD Card(Raspi-2) or with SD Adapter(RasPiB/B+).  
	- *Suggestion*: Use Class 10 SanDisk Ultra or Extreme models with higher R/W speeds
- Power Supply for Raspberry Pi(minimum 5VDC 1Amp micro USB)
- Ethernet cable (to connect to available, DHCP enabled, internet router)
  
### Optional Materials:
- HDMI cable
- Monitor with HDMI input(or apropriate adapter)
- USB Keyboard

### Installation Method 
###### *Disclaimer* - If you will be formatting an SD card be aware that you will be deleting all information stored on said card.  Eth(Embedded) is *NOT*  responsible for any data loss that may occur during the format process.

1. Download, unzip and copy the [ua-netinst files](https://github.com/debian-pi/raspbian-ua-netinst/releases/tag/v1.0.7) AND ADD ONLY the [Eth(Embedded) installer-config.txt](https://github.com/EthEmbedded/Raspi-Eth-Install/releases/tag/v0.1.0) file to an empty SD card(must first be formatted as FAT32)
2. Safely remove and install SD card into a powered down Raspberry Pi (1B, 1B+, or 2) with ethernet cable connected between RasPi and an internet enabled DHCP router.
3. Make sure there is activity with the RasPi's onboard led's(you should see green led's flashing as well as activity on the ethernet port led's)

	- If you see led's flashing you can walk away...go grab a coffee, or spend some time with your family:)
	- If you do not see led's flashing something may have gone wrong... If this is the case, the only way to truly	diagnose what has happened is to connect a Monitor and Keyboard, and reference the [ua-netinst 				github](https://github.com/debian-pi/raspbian-ua-netinst).
4. Once ua-netinst is complete, we can log in with:
	
	- login:	`root`
	- password:	`raspbian`

5. Download, unzip, and choose eth-install.sh OR geth-install.sh:

	`wget https://github.com/EthEmbedded/Raspi-Eth-Install/archive/v0.1.0.tar.gz`

	`tar -xvzf v0.1.0.tar.gz`

	`chmod +x eth-install.sh` OR `chmod +x geth-install.sh`

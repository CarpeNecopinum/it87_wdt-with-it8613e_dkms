# it87_wdt_dkms

## Why would I want this?

This helps you get your hardware watchdog working under linux when you're using a board with an IT8613 chipset.
It comes with a DKMS config, so you can update your kernel having to manually rebuild the module.

## Dependencies

Make sure you have the kernel headers installed, as well as the necessary bits to build the module itself:

```sh
apt install git build-essential linux-headers-amd64
```

## Building/Installation

Check out the source to /usr/src
```
git clone https://github.com/CarpeNecopinum/it87_wdt-with-it8613e_dkms.git /usr/src/it87_wdt_dkms-1.0
cd /usr/src/it87_wdt_dkms
```

Add the module to DKMS then instruct it to build and install it:
```
dkms add -m it87_wdt_dkms -v 1.0
dkms build -m it87_wdt_dkms -v 1.0
dkms install -m it87_wdt_dkms -v 1.0
```

## Rest

Install and activate the `watchdog` service, enable the Watchdog timeout in your UEFI BIOS and see if your machine doesn't randomly reboot now. 
KRELEASE ?= $(shell uname -r)
KBUILD ?= /lib/modules/$(KRELEASE)/build
obj-m := it87_wdt_dkms.o

modules:
	$(MAKE) -C $(KBUILD) M=$(PWD) modules

install: modules
	/usr/bin/install -m 644 -D it87_wdt_dkms.ko /lib/modules/$(KRELEASE)/kernel/drivers/watchdog/it87_wdt_dkms.ko
	/usr/bin/install -m 644 -D it87_wdt_dkms.conf /usr/lib/modules-load.d/it87_wdt_dkms.conf

clean:
	$(MAKE) -C $(KBUILD) M=$(PWD) clean

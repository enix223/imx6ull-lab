-include .env
export $(shell sed 's/=.*//' .env)

.PHONY: build-uboot
build-uboot:
	cd buildroot && make uboot-dirclean uboot-rebuild all

.PHONY: burn-sdcard
burn-sdcard:
	sudo dd if=buildroot/output/images/sdcard.img of=$(SD) bs=1M conv=fsync
	sudo eject $(SD)

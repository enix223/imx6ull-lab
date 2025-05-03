-include .env
export $(shell sed 's/=.*//' .env)

.PHONY: menuconfig
menuconfig:
	./scripts/buildroot-make.sh menuconfig

.PHONY: build
build:
	./scripts/buildroot-make.sh -j$(shell nproc)

.PHONY: build-uboot
build-uboot:
	./scripts/buildroot-make.sh uboot-dirclean uboot-rebuild all

.PHONY: burn-sdcard
burn-sdcard:
	sudo dd if=buildroot/output/images/sdcard.img of=$(SD) bs=1M conv=fsync
	sudo eject $(SD)

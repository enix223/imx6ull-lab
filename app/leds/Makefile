DOCKER_RUN := docker run --rm -it -v ${PWD}:/app -w /app -u ${UID}:${UID} enix223/build-imx6ull:4.9

all: led.bin
led.bin: led.s
	${DOCKER_RUN} arm-linux-gnueabihf-gcc -g -c led.s -o led.o
	${DOCKER_RUN} arm-linux-gnueabihf-ld -Ttext 0x87800000 led.o -o led.elf
	${DOCKER_RUN} arm-linux-gnueabihf-objcopy -O binary -S -g led.elf led.bin
	${DOCKER_RUN} arm-linux-gnueabihf-objdump -D led.elf > led.dis

.PHONY: clean
clean:
	rm -rf *.o *.bin *.elf *.dis *.imx

.PHONY: burn-bare
burn-bare:
	docker run --rm -it -v ${PWD}:/app \
		-w /app \
		--device=/dev/sda \
		--cap-add=SYS_ADMIN \
		enix223/build-imx6ull:4.9 imxdownload led.bin /dev/sda -256m

.PHONY: burn-with-uboot
burn-with-uboot:
	sudo mkdir -p /mnt/sda1
	sudo mount /dev/sda1 /mnt/sda1
	sudo cp led.bin /mnt/sda1/led.bin
	sudo umount /mnt/sda1

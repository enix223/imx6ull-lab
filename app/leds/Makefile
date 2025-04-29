all: led.o
led.o: led.s
	docker run --rm -it -v ${PWD}:/app -w /app -u ${UID}:${UID} enix223/build-imx6ull:4.9 arm-linux-gnueabihf-gcc -g -c led.s -o led.o
	docker run --rm -it -v ${PWD}:/app -w /app -u ${UID}:${UID} enix223/build-imx6ull:4.9 arm-linux-gnueabihf-ld -Ttext 0x87800000 led.o -o led.elf
	docker run --rm -it -v ${PWD}:/app -w /app -u ${UID}:${UID} enix223/build-imx6ull:4.9 arm-linux-gnueabihf-objcopy -O binary -S -g led.elf led.bin
	docker run --rm -it -v ${PWD}:/app -w /app -u ${UID}:${UID} enix223/build-imx6ull:4.9 arm-linux-gnueabihf-objdump -D led.elf > led.dis

clean:
	rm -rf *.o *.bin *.elf *.dis

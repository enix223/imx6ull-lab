# Turn on led D12 with ASM

## 1. Prepare sd card

1.1. Burn uboot to sd card
    ```
    sudo dd if=u-boot-with-spl.imx of=/dev/sda bs=1K seek=1 conv=fsync
    ```

1.2. Drop partition fdisk
    ```
    sudo fdisk /dev/sdX
    ```
    * Delete existing partitions (d).
    * Create a new partition (n, p, 1, 2048, +32M).
    * Set type to FAT32 (t, c).
    * Write changes (w).

1.3. create partition
    ```
    sudo mkfs.vfat -F 32 -n BOOT /dev/sdX1
    sudo mount /dev/sdX1 /mnt
    sudo cp led.bin /mnt
    sudo umount /mnt
    ```

## 2. Build led.bin

2.1. make led.bin
    ```
    make
    ```

2.2. copy led.bin to sdcard partition 1
    ```
    make burn-with-uboot
    ```

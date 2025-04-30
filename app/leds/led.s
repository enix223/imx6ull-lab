/*
 * Toogle LED
 * SNVS_TAMPER1 (GPIO5_01) -> D12 
 */
.section .text
.global _start

_start:
    b reset_handler    @ First instruction must be a branch
    .word 0xFFFFFFFF   @ Reserved vectors
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF
    .word 0xFFFFFFFF

reset_handler:
    /*
     * enable CCM
     */ 

    /* CCGR0 */
    ldr r0, =0x02c4068
    ldr r1, =0xffffffff
    str r1, [r0]

    /* CCGR1 */
    ldr r0, =0x020c406c
    str r1, [r0]

    /* CCGR2 */
    ldr r0, =0x020c4070
    str r1, [r0]

    /* CCGR3 */
    ldr r0, =0x020c4074
    str r1, [r0]

    /* CCGR4 */
    ldr r0, =0x020c4078
    str r1, [r0]

    /* CCGR5 */
    ldr r0, =0x020c407c
    str r1, [r0]

    /* CCGR6 */
    ldr r0, =0x020c4080
    str r1, [r0]

    /* 
     * Set IOMUXC_SNVS_SW_MUX_CTL_PAD_SNVS_TAMPER1
     * bit0~bit3 = 0101 (ALT5)
     */ 
    ldr r0, =0x0229000c
    ldr r1, =0x5
    str r1, [r0]

    /* 
     * Set IOMUXC_SNVS_SW_PAD_CTL_PAD_SNVS_TAMPER1 (229_0050h)
     * bit0 (slew rate) = 0
     * bit3~5 (DSE drive strength) = 0b110
     * bit6~7 (speed) = 10 (100MHz)
     * bit11 (ODE open drain enable) = 0 (disable OD)
     * bit12 (Pull/Keep enable) = 1 (enable pull)
     * bit13 (pull keep select) = 0 (keep)
     * bit14~bit15 (pull up config) = 00 (100K Ohm)
     * bit16 (Hyst eable) = 0 (disable)
     */
    ldr r0, =0x02290050
    ldr r1, =0x10b0
    str r1, [r0]

    /*
     * Set GPIO output direction (GPIOx_GDIR)
     * GPIO5_GDIR (20A_C004) bit1 = 0x01
     */
    ldr r0, =0x020AC004
    ldr r1, =0x01
    str r1, [r0]

    /*
     * Turn LED on
     * Write GDIOx_DR (GPIO5_IO1) = 0
     */ 
    ldr r0, =0x020AC000
    ldr r1, =0x0
    str r1, [r0]

loop:
    b loop

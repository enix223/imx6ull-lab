.global _start
_start:
    ; 
    ; enable CCM
    ; 

    ; CCGR0
    ldr r0, =0x02c4068
    ldr r1, =0xffffffff
    str r1, [r0]

    ; CCGR1
    ldr r0, =0x020c406c
    str r1, [r0]

    ; CCGR2
    ldr r0, =0x020c4070
    str r1, [r0]

    ; CCGR3
    ldr r0, =0x020c4074
    str r1, [r0]

    ; CCGR4
    ldr r0, =0x020c4078
    str r1, [r0]

    ; CCGR5
    ldr r0, =0x020c407c
    str r1, [r0]

    ; CCGR6
    ldr r0, =0x020c4080
    str r1, [r0]

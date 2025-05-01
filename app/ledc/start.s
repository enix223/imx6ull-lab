.global __start
__start:
    msr r0, cpsr ; read cpsr to r0
    bic r0, r0, #0x1f ;clear cpsr bit4~0
    orr r0, r0, #0x13 ; enable svc mode
    msr cpsr, r0 ; write r0 to cpsr

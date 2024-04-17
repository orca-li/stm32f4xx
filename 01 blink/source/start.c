#include <stdio.h>
#include <stdint.h>

#define SRAM_START                      (0x20000000U)
#define SRAM_SIZE_KB                    (64U)
#define SRAM_SIZE_BYTE                  (SRAM_SIZE_KB * 1024U)
#define SRAM_END                        (SRAM_START + SRAM_SIZE_BYTE)
#define STACK_POINTER_INIT_ADDRESS      (SRAM_END)

#define ISR_VECTOR_SIZE                 (2)

extern uint32_t _etext, _sdata, _edata, _sbss, _ebss;

void main(void);
void reset_handler(void);

uint32_t isr_vector[ISR_VECTOR_SIZE] __attribute__((section(".isr_vector"))) = {
    STACK_POINTER_INIT_ADDRESS,
    (uint32_t)&reset_handler,
};

void reset_handler(void){
    size_t size_data = (uint32_t)&_edata - (uint32_t)&_sdata;
    uint8_t *flash_data = (uint8_t*)&_etext;
    uint8_t *sram_data = (uint8_t*)&_sdata;

    for(uint32_t i = 0; i < size_data; i++)
        sram_data[i] = flash_data[i];

    uint32_t size_bss = (uint32_t)&_ebss - (uint32_t)&_sbss;
    uint8_t *bss = (uint8_t*)&_sbss;

    for(size_t i = 0; i < size_bss; i++)
        bss[i] = 0;

    main();
}
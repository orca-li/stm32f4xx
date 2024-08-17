#include <liteMCU.h>

extern uint32_t _etext, _sdata, _edata, _sbss, _ebss;

void main(void);

void Reset_Handler(void){
    uint32_t size_data = (uint32_t)&_edata - (uint32_t)&_sdata;
    uint8_t *flash_data = (uint8_t*)&_etext;
    uint8_t *sram_data = (uint8_t*)&_sdata;

    for(uint32_t i = 0; i < size_data; i++)
        sram_data[i] = flash_data[i];

    uint32_t size_bss = (uint32_t)&_ebss - (uint32_t)&_sbss;
    uint8_t *bss = (uint8_t*)&_sbss;

    for(uint32_t i = 0; i < size_bss; i++)
        bss[i] = 0;

    main();
}
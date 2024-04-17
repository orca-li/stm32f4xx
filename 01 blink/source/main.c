#include <stdint.h>

#define BASE_PERIPHERAL         (0x40000000U)
#define BASE_AHB1               (BASE_PERIPHERAL + 0x20000U)
#define BASE_RCC                (BASE_PERIPHERAL + 0x23800U)
#define BASE_GPIOC              (BASE_PERIPHERAL + 0x20800U)

#define RCC_AHB1ENR_OFFSET      (0x30U)
#define RCC_AHB1ENR_GPIOC       (0x02U)
#define RCC_AHB1ENR             ((volatile uint32_t*) (BASE_RCC + RCC_AHB1ENR_OFFSET))

#define GPIOx_MODER_OFFSET      (0x00U)
#define GPIOC_GPOM_13           (26U)
#define GPIOC_MODER             ((volatile uint32_t*) (BASE_GPIOC + GPIOx_MODER_OFFSET))

#define GPIOx_ODR_OFFSET        (0x14U)
#define GPIOC_ODR               ((volatile uint32_t*) (BASE_GPIOC + GPIOx_ODR_OFFSET))

#define LED_PIN13               (13)

void main(void){
    *RCC_AHB1ENR |= (1 << RCC_AHB1ENR_GPIOC);
    *GPIOC_MODER |= (1 << GPIOC_GPOM_13);
    
    while(1){
        *GPIOC_ODR ^= (1 << LED_PIN13);
        for (uint32_t i = 0; i < 1000000; i++);
    }
}
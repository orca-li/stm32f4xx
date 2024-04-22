#ifndef MEMORY_H
#define MEMORY_H

#define BASE_PERIPHERAL         (0x40000000U)
#define BASE_AHB1               (BASE_PERIPHERAL + 0x20000U)
#define BASE_RCC                (BASE_PERIPHERAL + 0x23800U)
#define BASE_GPIOC              (BASE_PERIPHERAL + 0x20800U)

#define RCC_AHB1ENR_OFFSET      (0x30U)
#define RCC_AHB1ENR_GPIOC       (0x02U)


#define GPIOx_MODER_OFFSET      (0x00U)
#define GPIOC_GPOM_13           (26U)


#define GPIOx_ODR_OFFSET        (0x14U)




#endif /* MEMORY_H */
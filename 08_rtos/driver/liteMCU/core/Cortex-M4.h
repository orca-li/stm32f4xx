#if !defined(CORTEX_M4)
#define CORTEX_M4

/* DS9716 5 Memort mapping - Figure 15. Memory map */
/* block map */
#define BLOCKN_SIZE (0x20000000u)
#define BLOCK0_BASE (BLOCKN_SIZE * 0)
#define BLOCK1_BASE (BLOCKN_SIZE * 1)
#define BLOCK2_BASE (BLOCKN_SIZE * 2)
#define BLOCK7_BASE (BLOCKN_SIZE * 7)

#define SRAM_START  (BLOCK1_BASE)
#define PERIPHERALS_BASE (BLOCK2_BASE)

/* Cortex-M4 Internal peripherals */
#define CORTEX_M4_BASE (BLOCK7_BASE)
/* PM0214 4.5 SysTick timer (STK) */
#define SYSTICK_BASE (CORTEX_M4_BASE + 0xE010)
/* PM0214 4.3 Nested vectored interrupt controller (NVIC) */
#define NVIC_BASE (CORTEX_M4_BASE + 0xE100)

static inline void __enable_irq(void)
{
    __asm volatile ("cpsie i" : : : "memory");
}

static inline void __disable_irq(void)
{
    __asm volatile ("cpsid i" : : : "memory");
}

#endif /* CORTEX_M4 */
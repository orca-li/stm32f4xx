ENTRY(Reset_Handler)

MEMORY
{
	FLASH (rx): ORIGIN = 0x08000000, LENGTH = 256K
	SRAM (rwx): ORIGIN = 0x20000000, LENGTH = 64K
}

_min_heap_size_ = 0x800 ; /* required amount of heap */

SECTIONS
{
  .isr_vector :
  {
    KEEP(*(.isr_vector))
  } >FLASH

  .text :
  {
    . = ALIGN(4);
		
    *(.text)
    *(.text.*)
    *(.rodata)
    *(.rodata.*)
    KEEP(*(.init))
    KEEP(*(.fini))
    *(.eh_frame)
    *(.ARM.exidx)
		
    . = ALIGN(4);
    _etext = .;
  } >FLASH

  _sidata = LOADADDR(.data);

  .data :
  {
    . = ALIGN(4);
    _sdata = .;
		
    *(.data)
    *(.data.*)
    KEEP(*(.init_array))
    KEEP(*(.fini_array))

    . = ALIGN(4);
    _edata = .;
  } >SRAM AT> FLASH

  .bss :
  {
    . = ALIGN(4);
    _sbss = .;
    __bss_start__ = _sbss;
		
    *(.bss)
    *(.bss.*)
		
    . = ALIGN(4);
    _ebss = .;
    __bss_end__ = _ebss;
  } >SRAM

  .user_heap :
  {
    . = ALIGN(8);
    PROVIDE (end = .);
    PROVIDE (_end = .);
    . = . + _min_heap_size_;
    . = ALIGN(8);
  } >RAM

  /* Remove information from the compiler libraries */
  /DISCARD/ :
  {
    libc.a ( * )
    libm.a ( * )
    libgcc.a ( * )
  }
}
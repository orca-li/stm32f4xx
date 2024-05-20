# variables
cc=arm-none-eabi-gcc
cf="-mcpu=cortex-m4 -mthumb -nostdlib"

# src_software="software/blink/blink.c software/morse/morse.c"
src_driver="driver/clock/clock.c driver/uart/uart.c"
src_core="core/startup.c"
src_featherlib="featherlib/fl_gpio.c featherlib/fl_nvic.c featherlib/fl_rcc.c featherlib/fl_uart.c"
src="main.c ${src_core} ${src_driver} ${src_software} ${src_featherlib}"

lds="core/linker_script.ld"
dir=build
name=blink
elf="${name}.elf"

oc=arm-none-eabi-objcopy
of="-O binary"
bin="${name}.bin"

rm="rm -rf"

#script
mkdir $dir
$cc $src -T $lds -o $dir/$elf $cf
$oc $of $dir/$elf $dir/$bin
# variables
cc=arm-none-eabi-gcc
cf="-mcpu=cortex-m4 -mthumb -nostdlib"

src_software="software/blink/blink.c software/morse/morse.c"
src_driver="driver/clock/clock.c"
src_core="core/startup.c"
src="main.c ${src_core} ${src_driver} ${src_software}"

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
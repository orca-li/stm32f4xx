PORT=$1
echo stm32flash $PORT
stm32flash -w build/blink.bin -v -g 0x0 $PORT
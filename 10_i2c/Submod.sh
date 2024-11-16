rm -rf ./driver/CMSIS
cd ./driver
git clone https://github.com/ARM-software/CMSIS_5 CMSIS
cd ./CMSIS/Device
mkdir ST
cd ./ST
git clone https://github.com/STMicroelectronics/cmsis_device_f4 STM32F4

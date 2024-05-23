#!/bin/bash
source scripts/config.sh
set -e
port=$1

action="stm32flash -w $bindir/$pname.bin -v -g 0x0 $port"
todo
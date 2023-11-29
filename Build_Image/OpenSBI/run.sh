#!/bin/bash

PREFIX="/opt/riscv/bin/"

XLEN=32

TOOLCHAIN_PREFIX="riscv32-unknown-linux-gnu-"
CC="riscv32-unknown-linux-gnu-gcc"
OBJCOPY="riscv32-unknown-linux-gnu-objcopy"
GNU_OBJDUMP="riscv32-unknown-linux-gnu-objdump"

rm -f imem.txt 

cp ../../linux_6/linux-6.1/vmlinux .

# OpenSBI for Spike with Linux as payload	
# cd opensbi
$OBJCOPY -O binary -R .note -R .comment -S ./vmlinux Image  #  u-boot
make -C opensbi distclean
make -C opensbi FW_PAYLOAD_PATH=../Image PLATFORM=generic CROSS_COMPILE=$TOOLCHAIN_PREFIX PLATFORM_RISCV_ISA=rv32ima PLATFORM_RISCV_XLEN=32

cp ./opensbi/build/platform/generic/firmware/fw_payload.elf .
#cp ./opensbi/build/platform/fpga/ariane/firmware/fw_payload.elf .
#fpga/ariane 

riscv32-unknown-linux-gnu-objdump -S -s fw_payload.elf > fw_payload.dump

riscv32-unknown-linux-gnu-objcopy -O binary  fw_payload.elf fw_payload.bin
python3 ./util/make_txt.py fw_payload.bin >> imem.txt
python3 ./util/make_bin.py imem.bin fw_payload.bin
#python3 ./util/make_imem.py fw_payload.bin 33554432 >> imem.txt



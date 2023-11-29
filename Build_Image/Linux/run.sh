
# (3) Copy the kernel config file and build the RISC-V Linux kernel
# make clean
#make mrproper
#make ARCH=riscv CROSS_COMPILE=riscv32-unknown-linux-gnu- defconfig
cp ../../BR_2021/buildroot-2021.05/output/images/rootfs.cpio .

make V=1 ARCH=riscv CROSS_COMPILE=riscv32-unknown-linux-gnu- vmlinux
riscv32-unknown-linux-gnu-objdump -S -s vmlinux > vmlinux.dump
# cd ..


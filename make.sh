nasm -fbin boot.asm -o boot.bin
nasm -fbin kernel.asm -o kernel.bin
cat boot.bin kernel.bin > hyperjoy.bin
rm kernel.bin
rm boot.bin
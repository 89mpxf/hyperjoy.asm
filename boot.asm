; Initialize BIOS requirements
org 0x7C00
%define SECTOR_AMOUNT 0x3F
jmp short start
nop

start:

; Initialize BIOS registers
cli
xor ax, ax
mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax
mov sp, 0x6EF0
sti

; Reset disk system
mov ah, 0
int 0x13
jc errorpart

; Initialize disk
mov bx, 0x8000
mov al, SECTOR_AMOUNT
mov ch, 0
mov dh, 0
mov cl, 2
mov ah, 2
int 0x13
jc errorpart
jmp 0x8000

; Boot error handling
errorpart:
mov si, errormsg
mov bh, 0x00
mov bl, 0x07
mov ah, 0x0E
.part:
lodsb
sub al, 0
jz end
int 0x10
jmp .part
end:
jmp $

errormsg db "Boot failed",0

; Apply signature to MBR
times 510-($-$$) db 0
db 0x55
db 0xAA

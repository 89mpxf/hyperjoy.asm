; Initialize BIOS requirements
org 0x8000
bits 16

; Set video mode
mov ah, 0
mov al, 13h
int 0x10

; Load image data from end of disk
call draw
jmp $

; Image draw function
draw:
	; Frame 1/7
	mov bx, 12
	.loop1:
		mov si, imageData+4227*0
		pusha
		xor ax, ax
		lodsb
		mov cx, ax
		lodsb
		mov dx, ax
		.x1:
			push dx
			.y1:
				mov bh, 0
				lodsb
				mov ah, 0xC
				int 0x10
			sub dx, 1
			jnz .y1
			pop dx
		sub cx, 1
		jnz .x1
		popa
	sub bx, 1
	jnz .loop1

	; Frame 2/7
	mov bx, 12
	.loop2:
		mov si, imageData+4227*1
		pusha
		xor ax, ax
		lodsb
		mov cx, ax
		lodsb
		mov dx, ax
		.x2:
			push dx
			.y2:
				mov bh, 0
				lodsb
				mov ah, 0xC
				int 0x10
			sub dx, 1
			jnz .y2
			pop dx
		sub cx, 1
		jnz .x2
		popa
	sub bx, 1
	jnz .loop2

	; Frame 3/7
	mov bx, 12
	.loop3:
		mov si, imageData+4227*2
		pusha
		xor ax, ax
		lodsb
		mov cx, ax
		lodsb
		mov dx, ax
		.x3:
			push dx
			.y3:
				mov bh, 0
				lodsb
				mov ah, 0xC
				int 0x10
			sub dx, 1
			jnz .y3
			pop dx
		sub cx, 1
		jnz .x3
		popa
	sub bx, 1
	jnz .loop3

	; Frame 4/7
	mov bx, 12
	.loop4:
		mov si, imageData+4227*3
		pusha
		xor ax, ax
		lodsb
		mov cx, ax
		lodsb
		mov dx, ax
		.x4:
			push dx
			.y4:
				mov bh, 0
				lodsb
				mov ah, 0xC
				int 0x10
			sub dx, 1
			jnz .y4
			pop dx
		sub cx, 1
		jnz .x4
		popa
	sub bx, 1
	jnz .loop4

	; Frame 5/7
	mov bx, 12
	.loop5:
		mov si, imageData+4227*4
		pusha
		xor ax, ax
		lodsb
		mov cx, ax
		lodsb
		mov dx, ax
		.x5:
			push dx
			.y5:
				mov bh, 0
				lodsb
				mov ah, 0xC
				int 0x10
			sub dx, 1
			jnz .y5
			pop dx
		sub cx, 1
		jnz .x5
		popa
	sub bx, 1
	jnz .loop5

	; Frame 6/7
	mov bx, 12
	.loop6:
		mov si, imageData+4227*5
		pusha
		xor ax, ax
		lodsb
		mov cx, ax
		lodsb
		mov dx, ax
		.x6:
			push dx
			.y6:
				mov bh, 0
				lodsb
				mov ah, 0xC
				int 0x10
			sub dx, 1
			jnz .y6
			pop dx
		sub cx, 1
		jnz .x6
		popa
	sub bx, 1
	jnz .loop6

	; Frame 7/7
	mov bx, 12
	.loop7:
		mov si, imageData+4227*6
		pusha
		xor ax, ax
		lodsb
		mov cx, ax
		lodsb
		mov dx, ax
		.x7:
			push dx
			.y7:
				mov bh, 0
				lodsb
				mov ah, 0xC
				int 0x10
			sub dx, 1
			jnz .y7
			pop dx
		sub cx, 1
		jnz .x7
		popa
	sub bx, 1
	jnz .loop7

	; Repeat
	rep stosd
	jmp draw

; Point to image data
imageData: incbin "image.bin"

; Assembler information
%assign usedMemory ($-$$)
%assign usableMemory (512*63)
%warning [usedMemory/usableMemory] Bytes used
times (512*63)-($-$$) db 0
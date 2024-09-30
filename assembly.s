.code16
.text
.global _start

_start:
    movw $10, %cx

loop:
	call print
	decw %cx
	jz loop_fim
	jmp loop

print:
	movb $'x', %al
	movb $0x0e, %ah
	int $0x10
	
	ret

loop_fim:
	hlt
	jmp loop_fim

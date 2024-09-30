.code16
.text
.global _start

_start:
	movw $54321, %ax	# AX = 54321
	movw $10000, %si	# SI = 10000

loop:
	cmpw $0, %si		# Compara SI com 0
	je loop_fim			# Pula pro loop_fim se igual

	call print			# Chama a função print

	movw %di, %ax		# Salva novo AX em DI

	movw %si, %ax		# Salva SI em AX (dividendo)
	movw $10, %cx		# CX = 10 (divisor)
	div %cx				# Divide AX por CX; quociente em AX, resto em DX
	movw %ax, %si		# Atualiza SI com o quociente

	movw %di, %ax		# Restaura AX de DI após a divisão

	jmp loop			# Recomeça o loop

print:
	movb $'x', %al
	movb $0x0e, %ah
	int $0x10
	
	ret

loop_fim:
	hlt
	jmp loop_fim
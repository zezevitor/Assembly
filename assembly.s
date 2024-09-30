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
	div %cx				# Divide AX por CX (quociente em AX, resto em DX)
	movw %ax, %si		# Atualiza SI com o quociente

	movw %di, %ax		# Restaura AX de DI após a divisão

	jmp loop			# Recomeça o loop

print:
	movw %di, %ax		# Salva AX em DI
	div %si				# Divide AX por SI (quociente em AX, resto em DX)

	# Faltando lógica de print

	movw %dx, %ax		# AX passa a se tornar o resto da divisão
						# AX / 10000 => AX : 5 && DX : 4321
						# AX / 1000 => AX : 4 && DX : 321
						# AX / 100 => AX : 3 && DX : 21
						# AX / 10 => AX : 2 && DX : 1
						# AX / 1 => AX : 1 && DX : 
	
	ret

loop_fim:
	hlt					# Pausa de sistema
	jmp loop_fim
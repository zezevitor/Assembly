.code16
.text
.global _start

_start:
    movw $msg, %si       	# Carrega o endereço da string em SI

print_loop:
    lodsb                	# Carrega o byte atual da memória em AL e avança 1 byte
    cmpb $0, %al         	# Verifica se AL é nulo (fim da string)
    je loop_fim          	# Se for nulo, termina o loop

    movb $0x0e, %ah      	# Configura AH para usar o serviço de print da BIOS
    int $0x10            	# Interrupção da BIOS para exibir o caractere

    jmp print_loop       	# Continua o loop

loop_fim:
    hlt                 	# Para o sistema
    jmp loop_fim         	# Loop infinito após o halt

msg:
    .ascii "Andre"  		# A string a ser exibida
    .byte 0                 # Terminador nulo para a string

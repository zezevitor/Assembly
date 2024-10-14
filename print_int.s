.code16
.text
.global _start

_start:
    movw $54321, %ax    # Carrega o número 54321 em AX
    movw $10000, %si    # Carrega 10000 em SI

loop:
    cmpw $0, %si        # Verifica se SI é 0
    je loop_fim         # Se SI for 0, fim do loop

    xorw %dx, %dx       # Zera DX para a divisão
    divw %si            # Divide AX por SI

    addb $0x30, %al     # Converte o dígito para ASCII
    movb $0x0e, %ah     # Configura AH para usar o serviço de print da BIOS
    int $0x10           # Interrupção da BIOS para exibir o caractere

    movw %dx, %di       # Carrega o resto em DI
    xorw %dx, %dx       # Zera DX para a divisão

    movw %si, %ax       # Carrega o valor atual de SI em AX (Dividendo)
    movw $10, %cx       # Carrega 10 em CX (Divisor)
    div %cx             # Divide AX por CX (quociente em AX, resto em DX)
    movw %ax, %si       # Atualiza SI com o quociente

    movw %di, %ax       # Atualiza AX com o resto da divisão

    jmp loop            # Continua o loop

loop_fim:
    hlt                 # Para o sistema
    jmp loop_fim        # Loop infinito após o halt

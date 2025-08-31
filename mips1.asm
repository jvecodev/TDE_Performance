# João Vitor Correa Oliveira

.data
    sequencia: .word 4, 3, 9, 5, 2, 1      
    tamanho:   .word 6                    
    espaco:    .asciiz " "                 
    msg_inicial: .asciiz "Sequencia original: "  
    msg_final:   .asciiz "\nSequencia ordenada: "

.text
.globl main
main:
    # --- Imprime a mensagem inicial ---
    li $v0, 4                
    la $a0, msg_inicial        
    syscall

    # --- Preparação para imprimir a sequência original ---
    la $t0, sequencia           
    lw $t1, tamanho           
    li $t2, 0                   

print_loop_inicial:
    beq $t2, $t1, inicio_ordenacao 
    sll $t3, $t2, 2                
    add $t3, $t0, $t3               
    lw $a0, 0($t3)                  
    li $v0, 1                      
    syscall
    li $v0, 4
    la $a0, espaco                   
    syscall
    addi $t2, $t2, 1               
    j print_loop_inicial             

inicio_ordenacao:
    # --- Inicialização das variáveis para ordenação (Bubble Sort) ---
    la $s0, sequencia     
    lw $s1, tamanho      
    addi $s2, $s1, -1     
    li $t0, 0            

# Lucas Stopinski

loop_externo:
    # Loop externo do Bubble Sort
    beq $t0, $s2, fim_ordenacao  
    li $t1, 0                   
    sub $s3, $s2, $t0             

loop_interno:
    # Loop interno: compara elementos adjacentes
    beq $t1, $s3, proximo_i       
    sll $t2, $t1, 2               
    add $t3, $s0, $t2             
    lw $t4, 0($t3)                
    lw $t5, 4($t3)               
    ble $t4, $t5, nao_troca       
    sw $t5, 0($t3)                 
    sw $t4, 4($t3)

nao_troca:
    addi $t1, $t1, 1               
    j loop_interno                  

proximo_i:
    addi $t0, $t0, 1              
    j loop_externo              

fim_ordenacao:
    # --- Impressão da sequência ordenada ---
    li $v0, 4
    la $a0, msg_final
    syscall

    la $t0, sequencia
    lw $t1, tamanho
    li $t2, 0

print_loop_final:
    beq $t2, $t1, fim_programa    
    sll $t3, $t2, 2
    add $t3, $t0, $t3
    lw $a0, 0($t3)
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, espaco
    syscall
    addi $t2, $t2, 1
    j print_loop_final

fim_programa:
    li $v0, 10                  
    syscall

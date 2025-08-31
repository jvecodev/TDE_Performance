.data
	res: .asciiz "Resultado da conta do ano de nascimento de cada integrante: "
.text   
	li $t0, 2006
	li $t1, 2006
	li $t2, 2006
	
	add $s1, $t0, $t1 # s1 = t0 + t1
	add $s1, $s1, $t2 # s1 = s1 + t2
	
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
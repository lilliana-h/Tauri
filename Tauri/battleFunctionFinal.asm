.data
	alien: .byte 100

.text
BATTLEFUNCTION:
	li $v0, 1
	mul, $t1, $t2, 10
	b ACTUALBATTLETHING
	#la $a0, ($t1)
	#syscall

	ACTUALBATTLETHING:
	li $v0, 42  
	li $a1, 100 
	syscall     
	li $v0, 1   
	syscall   
	
	li $v0, 4
	la $a0, return
	syscall
	
	sub $k0, $a0, $t1
	la $a0, ($k0) 
	syscall

	
	lb $t9, player

	
	blez $t9, Lose
	lb $t9, alien
	
	blez $t9, Win
	
	ble $k0, 10, HITTED
	li  $v0, 10
	syscall
	
		HITTED:
		lb $t9, alien
		sub $t9, $t9, 25
		sb $t9, alien
		li $v0, 1
		lb $t8, alien
		la $a0, ($t8)
		syscall
		b BATTLEFUNCTION
		
		MISSED:
		lb $t9, player
		sub $t9, $t9, 45
		sb $t9, player
		b BATTLEFUNCTIONBATTLEFUNCTION
	
		MISSED:
		lb $t9, player
		sub $t9, $t9, 45
		sb $t9, player
		b BATTLEFUNCTION

.data
	distribute: .ascii "Choose your stats. You have MOBILITY, SHOOTYPATOOTIE, SWOLNESS, TECHNICAL SKILL, and STEALTH. Choose carefully. You only have 8pts to distribute."
	mobility: .asciiz "MOBILITY: \n" 
	shootypatootie: .asciiz "SHOOTYPATOOTIE: \n"
	
.text
#------8pts log------

	li $v0, 4
	li $a0, distribute
	syscall 
	li $t0, 8

#------health------

	li $v0, 1
	li $t1, 100
	syscall
	
#------stats------

	#------1mobility (t2)------
	li $v0, 4
	la $a0, mobility
	syscall
	li $t2, 2 #(mobility starts at base of 2)
	li $v0, 1
	syscall
	add $t2, $t2, $v0 #(mobility = 2 + user_input)
	sub $t0, $t0, $v0 #[TAKING AWAY FROM THE 8pts LOG -> 8pts = 8pts - user input]
	
	#------2shootypatootie (t3)------
	li $v0, 4
	li $a0, shootypatootie
	syscall
	li $t3, 2 #(shootypatootie at base of 2)
	li $v0, 1
	syscall
	add $t3, $t3, $v0 #(shootypatootie = 2 + user input)
	sub $t0, $t0, $v0 #[TAKING AWAY FROM THE 8pts LOG -> 8pts = 8pts - user input]
	
	#------3swolness (t4)------
	li $v0, 4
	li $a0, swolness
	syscall
	li $t4, 2 #(swolness at base of 2)
	li $v0, 1
	syscall
	add $t4, $t4, $v0 #(swolness = 2 + user input)
	sub $t0, $t0, $v0 #[TAKING AWAY FROM THE 8pts LOG -> 8pts = 8pts - user input]
	
	#------4technical skill (t5)------
	li $v0, 4
	li $a0, technical
	syscall
	li $t5, 2 #(technical skill at base of 2)
	li $v0, 1
	syscall
	add $t5, $t5, $v0 #(technical skill = 2 + user input)
	sub $t0, $t0, $v0 #[TAKING AWAY FROM THE 8pts LOG -> 8pts = 8pts - user input] 
	
	#------4stealth (t6)-----
	li $v0, 1
	li $t2, 2 #stealth
	syscall
	
#------
.data
	distribute: .asciiz "Choose your stats. You have MOBILITY, SHOOTYPATOOTIE, SWOLNESS, TECHNICAL SKILL, and STEALTH. \nChoose carefully. \nYou only have 8pts to distribute."
	shootypatootie: .asciiz "\nSHOOTYPATOOTIE: "
	swolness: .asciiz "\nSWOLNESS: "
	technical: .asciiz "\nTECHNICAL SKILL: "
	points: .asciiz "\nPoints left: "
	error: .asciiz "Overload. Please re-enter."
	
.text
#------8pts log------

	li $v0, 4
	la $a0, distribute
	syscall 
	li $t0, 8
	
.data
#------health------
	player: .byte 100

	
.text	
#------stats------
	#------1shootypatootie (t2)------
	change_shootypatootie:
	li $k1, 0
	li $v0, 4
	la $a0, shootypatootie
	syscall
	li $t2, 2 #(mobility starts at base of 2)
	li $v0, 5
	syscall
	sub $k1, $t0, $v0 #((temp holder of pts left))
	bltz $k1,  #((if less than zero, go to beginning of section))
	add $t2, $t2, $v0 #(mobility = 2 + user_input)
	sub $t0, $t0, $v0 #[TAKING AWAY FROM THE 8pts LOG -> 8pts = 8pts - user input]
	beqz $t0, after_stats #((if reaching zero, go to end))
	b right
	
	error_msg:
	li $v0, 4
	la $a0, error
	syscall
	jal change_shootypatootie
	
	#----points left----
	right:
	li $v0, 4
	la $a0, points
	syscall
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	#------2swolness (t3)------
	change_swolness:
	li $v0, 4
	la $a0, swolness
	syscall
	li $t3, 2 #(shootypatootie at base of 2)
	li $v0, 5
	syscall
	sub $k1, $t0, $v0 #((temp holder of pts left))
	bltz $k1, error_msg1 #((if less than zero, go to beginning of section))
	add $t3, $t3, $v0 #(shootypatootie = 2 + user input)
	sub $t0, $t0, $v0 #[TAKING AWAY FROM THE 8pts LOG -> 8pts = 8pts - user input]
	beqz $t0, after_stats #((if reaching zero, go to end))
	b right
	
	error_msg1:
	li $v0, 4
	la $a0, error
	syscall
	jal change_swolness
	
	#----points left----
	right1:
	li $v0, 4
	la $a0, points
	syscall
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	#------3technical (t4)------
	change_technical:
	li $v0, 4
	la $a0, technical
	syscall
	li $t4, 2 #(swolness at base of 2)
	li $v0, 5
	syscall
	sub $k1, $t0, $v0 #((temp holder of pts left))
	bltz $k1, error_msg2 #((if less than zero, go to beginning of section))
	add $t4, $t4, $v0 #(swolness = 2 + user input)
	sub $t0, $t0, $v0 #[TAKING AWAY FROM THE 8pts LOG -> 8pts = 8pts - user input]
	beqz $t0, after_stats #((if reaching zero, go to end))
	b right
	
	error_msg2:
	li $v0, 4
	la $a0, error
	syscall
	jal change_technical
	
	#----points left----
	right2:
	li $v0, 4
	la $a0, points
	syscall
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	#------
	after_stats:
	li $v0, 10
	syscall

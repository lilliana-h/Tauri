.data
	distribute: .asciiz "Choose your stats. You have MOBILITY, SHOOTYPATOOTIE, SWOLNESS, TECHNICAL SKILL, and STEALTH. \nChoose carefully. \nYou only have 8pts to distribute."
	mobility: .asciiz "\nMOBILITY: " 
	shootypatootie: .asciiz "\nSHOOTYPATOOTIE: "
	swolness: .asciiz "\nSWOLNESS: "
	technical: .asciiz "\nTECHNICAL SKILL: "
	stealth: .asciiz "\nSTEALTH: "
	points: .asciiz "\nPoints left: "
	
.text
#------8pts log------

	li $v0, 4
	la $a0, distribute
	syscall 
	li $t0, 8

#------health------

	#li $v0, 1
	li $t1, 100
	
#------stats------



   #------limit------

   

	#------1mobility (t2)------
	change_mobility:
	li $v0, 4
	la $a0, mobility
	syscall
	li $t2, 2 #(mobility starts at base of 2)
	li $v0, 5
	syscall
	sub $k1, $t0, $v0 #((temp holder of pts left))
	bltz $k1, change_mobility #((if less than zero, go to beginning of section))
	add $t2, $t2, $v0 #(mobility = 2 + user_input)
	sub $t0, $t0, $v0 #[TAKING AWAY FROM THE 8pts LOG -> 8pts = 8pts - user input]
	beqz $t0, after_stats #((if reaching zero, go to end))
	
	#----points left----
	li $v0, 4
	la $a0, points
	syscall
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	#------2shootypatootie (t3)------
	change_shootypatootie:
	li $v0, 4
	la $a0, shootypatootie
	syscall
	li $t3, 2 #(shootypatootie at base of 2)
	li $v0, 5
	syscall
	sub $k1, $t0, $v0 #((temp holder of pts left))
	bltz $k1, change_shootypatootie #((if less than zero, go to beginning of section))
	add $t3, $t3, $v0 #(shootypatootie = 2 + user input)
	sub $t0, $t0, $v0 #[TAKING AWAY FROM THE 8pts LOG -> 8pts = 8pts - user input]
	beqz $t0, after_stats #((if reaching zero, go to end))
	
	#----points left----
	li $v0, 4
	la $a0, points
	syscall
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	#------3swolness (t4)------
	change_swolness:
	li $v0, 4
	la $a0, swolness
	syscall
	li $t4, 2 #(swolness at base of 2)
	li $v0, 5
	syscall
	sub $k1, $t0, $v0 #((temp holder of pts left))
	bltz $k1, change_swolness #((if less than zero, go to beginning of section))
	add $t4, $t4, $v0 #(swolness = 2 + user input)
	sub $t0, $t0, $v0 #[TAKING AWAY FROM THE 8pts LOG -> 8pts = 8pts - user input]
	beqz $t0, after_stats #((if reaching zero, go to end))
	
	#----points left----
	li $v0, 4
	la $a0, points
	syscall
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	#------4technical skill (t5)------
	change_technical:
	li $v0, 4
	la $a0, technical
	syscall
	li $t5, 2 #(technical skill at base of 2)
	li $v0, 5
	syscall
	sub $k1, $t0, $v0 #((temp holder of pts left))
	bltz $k1, change_technical #((if less than zero, go to beginning of section))
	add $t5, $t5, $v0 #(technical skill = 2 + user input)
	sub $t0, $t0, $v0 #[TAKING AWAY FROM THE 8pts LOG -> 8pts = 8pts - user input]
	beqz $t0, after_stats #((if reaching zero, go to end))
	
	#----points left----
	li $v0, 4
	la $a0, points
	syscall
	li $v0, 1
	la $a0, ($t0)
	syscall
	
	#------4stealth (t6)-----
	change_stealth:
	li $v0, 4
	la $a0, stealth
	syscall
	li $t2, 2 #(stealth at base of 2)
	li $v0, 5
	syscall
	sub $k1, $t0, $v0 #((temp holder of pts left))
	bltz $k1, change_stealth #((if less than zero, go to beginning of section))
	add $t5, $t5, $v0 #(stealth = 2 + user input)
	sub $t0, $t0, $v0 #[TAKING AWAY FROM THE 8pts LOG -> 8pts = 8pts - user input]
	beqz $t0, after_stats #((if reaching zero, go to end))
	
	#----points left----
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

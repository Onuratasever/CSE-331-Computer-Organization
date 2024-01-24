		.data

blank:		.asciiz " "
enter:		.asciiz "\n"

strEnterinput:	.asciiz "Enter your input single line\n"
strEnterRow:	.asciiz "Enter the number of row\n"
strEnterColumn:	.asciiz "Enter the number of column\n"
strEnterSteps: 	.asciiz "Enter number of steps\n"

newBomb:		.asciiz "O"		
oldBomb:		.asciiz "1"		
empty:		.asciiz "."	
		
		.text
	
start: 
	j main #It starts program with main function

print:	

	add $t5, $zero, $s1 # t5 = 0 + s1 (number of rows)
	add $t2, $zero, $s2 # t2 = 0 + s2 (number of columns)
	
	#This part stores s registers not to lose their values
	addi $sp, $sp, -24 # It will store 6 items each is 4 byte (some of them 1)
	sw $s7, 20($sp) # It stores s7 in the stack
	sw $s6, 16($sp)	# It stores s6 in the stack
	sw $s3, 12($sp)	# It stores s3 in the stack
	sb $s0, 8($sp)	# It stores s0 in the stack
	sb $s1, 4($sp)	# It stores s1 in the stack
	sb $s2, 0($sp)	# It stores s2 in the stack
	
	la $a0, blank
	lb $s0, 0($a0) # s0 = ' '
		
	la $a0, enter
	lb $s1, 0($a0)# s1 = '\n'
	
	la $a0, oldBomb
	lb $s6, 0($a0)# s6 = '1'
	
	la $a0, newBomb
	lb $s7, 0($a0)# s7 = 'O'
	
	#enter için
	la $a0, 0($s1)
	li $v0, 11
	syscall #It prints enter for each call
	
	#t0 is counter for outer loop
	add $t0, $zero, $zero # t=0 başlatır.
	loop1:
 		beq $t0, $t5, exit1 # if(t0 == t5) go exit1
 		
 		#t1 is counter for inner loop
		add $t1, $zero, $zero	# t1 = 0 + 0
	
	loop2:
		beq $t1, $t2, exit2 # if(t1 == t2) go exit2
	
		#It calculates index of string. Because it is like map[i][j] but there is single line and it is map[i*length + j]
		mult $t0, $t2 #t3 = t0 * t2
		mflo $t3 
		add $t3, $t3, $t1 #t3 = t3 + 1
		
		#It adds to input string so it can find the index
		add $s2, $s3, $t3 # s2 = s3 + t3
		
		#It stores char in the temp register to compare
		lb $t4, 0($s2) # t4 = s2[0] 
	
		#t4 is char that we have and s6 is '1' which means old bomb. If it is equal it goes esitdegiller.
		beq $t4, $s6, esitdegiller #if(t4 == s6) go esitdegiller
			#print the char whatever t4 is
			la $a0, 0($t4)
			li $v0, 11
			syscall #It prints t4
			
			j cikis # It jumps cikis label
		esitdegiller:
			#print the char 'O'
			la $a0, 0($s7)
			li $v0, 11
			syscall #It prints s7
		cikis:
	
		#It prints blank
		la $a0, 0($s0)
		li $v0, 11
		syscall # It prints ' '
	
		addi $t1, $t1, 1 # t1 = t1 + 1
	
		j loop2 #It jumps loop2 label
	exit2:
		addi $t0, $t0, 1 #t0 = t0 + 1
		
		#enter için
		la $a0, 0($s1)
		li $v0, 11
		syscall # It prints '\n'
		
		j loop1 #It jumps loop1 label
	exit1:
		#This part get their values back not to lose
		lb $s2, 0($sp)	#It loads from stack to s2
		lb $s1, 4($sp)	#It loads from stack to s1
		lb $s0, 8($sp)	#It loads from stack to s0
		lw $s3, 12($sp)	#It loads from stack to s3
		lw $s6, 16($sp)	#It loads from stack to s6
		lw $s7, 20($sp)	#It loads from stack to s7
		addi $sp, $sp, 24 # It will delete 6 items

		jr $ra #jumps to adress
		
putBomb:
	
	add $t5, $zero, $s1 # t5 = 0 + s1 (number of rows)
	add $t2, $zero, $s2 # t2 = 0 + s2 (number of columns)
	
	#This part stores s registers not to lose their values
	addi $sp, $sp, -20 # It will store 5 items in the stack
	sb $s0, 0($sp) 	# It stores s0 in the stack
	sb $s1, 4($sp)	# It stores s1 in the stack
	sb $s2, 8($sp)	# It stores s2 in the stack
	sb $s4, 12($sp)	# It stores s4 in the stack
	sw $s3, 16($sp)	# It stores s3 in the stack
	
	la $a0, empty
	lb $s0, 0($a0) # s0 = '.'
	
	la $a0, oldBomb
	lb $s1, 0($a0)# s1 = '1'
	
	la $a0, newBomb
	lb $s4, 0($a0)# s4 = 'O'

	#counter for outer loop
	add $t0, $zero, $zero # t=0 başlatır
	controlLoop:
		beq $t0, $t5, exitLoop1 # if(t0 == t5) go exitLoop1
		
		#counter for inner loop
		add $t1, $zero, $zero	# t1 = 0 + 0

	controlLoop2:
		#t2 is number of columns
		beq $t1, $t2, exitLoop2 # if(t1 == t2) go exitLoop2	
			
			#It calculates index of string. Because it is like map[i][j] but there is single line and it is map[i*length + j]
			mult $t0, $t2 #t3 = t0 * t2
			mflo $t3 
			add $t3, $t3, $t1 #t3 = t3 + t1
			
			#It adds to input string so it can find the index
			add $s2, $s3, $t3 # s2 = s3 + t3
			
			#It stores char in the temp register to compare			
			lb $t4, 0($s2) # t4 = s2[0] 
	
		#s0 is '.'. It compares if index is empty.
		bne $t4, $s0, controlStatement # if(t4 == s0) go controlStatement
			#Index is empty. It puts 'O'
			sb $s4, 0($s2) # s2 = s4
		j ifExit # jumps ifExit label
	controlStatement:
		#If there is already a bomb in the index. To mark it as old bomb it makes it '1' which means old bomb
		bne $t4, $s4, ifExit	#if(t4 != s4) go ifExit
		sb $s1, 0($s2) # s1 = s4
	ifExit:
		
		#Increases inner loop counter
		addi $t1, $t1, 1 # t1 = t1 + 1
		j controlLoop2 # it jumps controlLoop2 label
	
	exitLoop2:
		#Increases outer loop counter
		addi $t0, $t0, 1 #t0 = t0 + 1
		j controlLoop # it jumps controlLoop label
	
	exitLoop1:
	
		#This part get their values back not to lose
		lb $s4, 12($sp)	#It loads from stack to s4
		lb $s2, 8($sp)	#It loads from stack to s2
		lb $s1, 4($sp)	#It loads from stack to s1
		lb $s0, 0($sp)	#It loads from stack to s0
		lw $s3, 16($sp)	#It loads from stack to s3
		addi $sp, $sp, 20 # It will delete 5 items
		
		jr $ra # It jumps to adress
		
detonateBomb:
	add $t2, $zero, $s2 # t2 = 0 + s2 (number of columns)
	add $t8, $zero, $s1 # t8 = 0 + s1 (number of rows) 
	
	#This part stores s registers not to lose their values
	addi $sp, $sp, -32 # It will store 8 items
	sb $s0, 0($sp)	# It stores s0 in the stack
	sb $s1, 4($sp)	# It stores s1 in the stack
	sb $s2, 8($sp)	# It stores s2 in the stack
	sw $s3, 12($sp)	# It stores s3 in the stack	
	sb $s4, 16($sp)	# It stores s4 in the stack
	sw $s5, 20($sp)	# It stores s5 in the stack
	sw $s6, 24($sp)	# It stores s6 in the stack
	sw $s7, 28($sp)	# It stores s7 in the stack
	
	la $a0, empty
	lb $s0, 0($a0) # s0 = '.'
	
	la $a0, oldBomb
	lb $s1, 0($a0)# s1 = '1'
	
	la $a0, newBomb
	lb $s4, 0($a0)# s4 = 'O'
	
	#It assigns bound indexes. I will use them while controlling neighbour indexes not to go out of bound
	add $s5, $zero, $zero	#s5 = 0 + 0
	add $s6, $zero, $t2	#s6 = 0 + t2
	add $s7,$zero, $zero	#s7 = zero + zero
	add $t8, $zero, $t8	#t8 = zero + t8
	
	#counter for outer loop
	add $t0, $zero, $zero # t=0 başlatır.
	
	loopSon1:
 		beq $t0, $t8, exitSon1 # if(t0 == t8) go exitSon1
		#counter for inner loop
		add $t1, $zero, $zero	# t1 = 0 + 0
	
	loopSon2:
		beq $t1, $t2, exitSon2 # if(t1 == t2) go exitSon2

		#It calculates index of string. Because it is like map[i][j] but there is single line and it is map[i*length + j]
		mult $t0, $t2 #t3 = t0 * t2
		mflo $t3 
		add $t3, $t3, $t1 #t3 = t3 + t1
		
		#It adds to input string so it can find the index
		add $s2, $s3, $t3 # s2 = s3 + t3
		
		#It stores char in the temp register to compare
		lb $t4, 0($s2) 	# t4 = s2[0]
	 
	 	#s1 is '1' which means old bomb. It is ready to detonate. If it is not '1' it does not go this code block
		bne $t4, $s1, go #if(t4 != s1) goes go label
		
			#It converts current index '1' to '.'
			sb $s0, 0($s2)	# s2[0] = s0
			
			#It substracts 1 to check bound.
			addi $t5, $t0, -1 # t5 = t0 - 1
			
			#s7 is zero. So it checks bound for t0 - 1
			blt  $t5,$s7 ,bura #if(t5 < s7)it goes bura label | s7 <= t5 ise girer
				
				#It calculates map[t0 - 1][t1]
				mult $t5,$t2 #t3 = t5 * t2
				mflo $t3
				add $t3, $t3, $t1 #t3 = t3 + t1
				
				#It adds to adress to find index
				add $s2, $s3, $t3 # s2 = s3 + t3
				
				#It stores char in the temp register to compare
				lb $t4, 0($s2) # t4 = s2[0]
				
				#s1 is '1' which means old bomb. If neighbour index is '1' I do not want it to detonate so it goes other label
				beq $t4, $s1,bura # if(t4 == s1) it goes bura label
					#It makes current index '.' 
					sb $s0, 0($s2) #s2[0] = s0
			bura:
			#It adds 1 to check bound.
			addi $t5, $t0, 1 # t5 = t0 + 1
			
			#t8 is number of rows. It checks bound for current index
			ble $t8, $t5, bura1 #if(t8 <= t5) it goes bura1
				
				#It calculates map[t0 + 1][t1]
				mult $t5,$t2 #t3 = t5 * t2
				mflo $t3
				add $t3, $t3, $t1 #t3 = t3 + t1
				
				#It adds to adress to find index
				add $s2, $s3, $t3 # s2 = s3 + t3
				
				#It stores char in the temp register to compare
				lb $t4, 0($s2) # t4 = s2[0]
				
				#s1 is '1' which means old bomb. If neighbour index is '1' I do not want it to detonate so it goes other label
				beq $t4, $s1,bura1  # if(t4 == s1) it goes bura1 label
					#It makes current index '.'
					sb $s0, 0($s2) #s2[0] = s0
			
			bura1:
			#It substract 1 to check bound.
			addi $t5, $t1, -1 # t5 = t1 - 1
			
			#s5 is zero. So it checks bound for t1 - 1
			blt  $t5,$s5 ,bura2 #if(t5 < s5)it goes bura2 label | s5 <= t5 ise girer
				
				#It calculates map[t0][t1 - 1]
				mult $t0,$t2 #t3 = t0 * t2
				mflo $t3
				add $t3, $t3, $t5 #t3 = t3 + t5
				
				#It adds to adress to find index
				add $s2, $s3, $t3 # s2 = s3 + t3
				
				#It stores char in the temp register to compare
				lb $t4, 0($s2) # t4 = s2[0]
		
				#s1 is '1' which means old bomb. If neighbour index is '1' I do not want it to detonate so it goes other label		
				beq $t4, $s1,bura2 # if(t4 == s1) it goes bura2 label
					#It makes current index '.'					
					sb $s0, 0($s2) #s2[0] = s0
		
			bura2:
			#It adds 1 to check bound.
			addi $t5, $t1, 1 # t5 = t1 + 1
			
			#s6 is number of columns. It checks bound for current index
			ble $s6, $t5, go  #if(s6 <= t5) it goes go label
				
				#It calculates map[t0][t1 + 1]
				mult $t0,$t2 #t3 = t0 * t2
				mflo $t3
				add $t3, $t3, $t5 #t3 = t3 + t5
				
				#It adds to adress to find index
				add $s2, $s3, $t3 # s2 = s3 + t3
				
				#It stores char in the temp register to compare
				lb $t4, 0($s2) # t4 = s2[0]
				
				#s1 is '1' which means old bomb. If neighbour index is '1' I do not want it to detonate so it goes other label
				beq $t4, $s1,go # if(t4 == s1) it goes go label
					#It makes current index '.'
					sb $s0, 0($s2) #s2[0] = s0
			
		go:
		
		#It increases inner loop counter
		addi $t1, $t1, 1 # t1 = t1 + 1
	
		j loopSon2 # It jumps loopSon2 label
	exitSon2:
		#It increases outer loop counter
		addi $t0, $t0, 1 #t0 = t0 + 1
		
		j loopSon1 # It jumps loopSon1 labe
	exitSon1:
	
		#This part get their values back not to lose
		lb $s0, 0($sp)	#It loads from stack to s0
		lb $s1, 4($sp)	#It loads from stack to s2
		lb $s2, 8($sp)	#It loads from stack to s2
		lw $s3, 12($sp)	#It loads from stack to s3
		lb $s4, 16($sp)	#It loads from stack to s4
		lw $s5, 20($sp)	#It loads from stack to s5
		lw $s6, 24($sp)	#It loads from stack to s6
		lw $s7, 28($sp)	#It loads from stack to s7
		addi $sp, $sp, 32 # It will delete 8 items
		
		jr $ra # It jumps to adress
	
main:	
		#print string number of steps
		la $a0, strEnterSteps #a0 = &strEnterSteps
		li $v0, 4 #It loads four to print strin to terminal
		syscall

		#read integer to get number of steps
		li $v0, 5 # v0 = 5
		syscall	#system call to get input
		addi $s4, $v0, -1 # s4 = v0 - 1
		
		#print string number of rows
		la $a0, strEnterRow  #a0 = &strEnterRow
		li $v0, 4 #It loads four to print strin to terminal
		syscall
		
		#read integer to get number of rows
		li $v0, 5 # v0 = 5
		syscall #system call to get input
		add $s1, $v0, $zero # s1 = v0 - 1
		
		#print string number of columns
		la $a0, strEnterColumn #a0 = &strEnterColumn
		li $v0, 4 #It loads four to print strin to terminal
		syscall
		
		#read integer to get number of columns
		li $v0, 5 # v0 = 5
		syscall #system call to get input
		add $s2, $v0, $zero # s2 = v0 + 0
		
		#It calculates the total size of one dimensional string
		mult $s1, $s2 # s3 = s1 * s2
		mflo $s3
		
		#It adds 2 more spaces because of \0 character
		li $t2, 2 #t2 = 2
		add $a0,$t2, $s3     # a0 = t2 + s3 Load the size of the array into $a0
		
		#to obey contract I put a0 to t0
		add $t9, $zero, $a0 #t9 = 0 + a0

       	 	# Call sbrk to dynamically allocate memory for the array
       	 	li $v0, 9  #v0 = 9             
       	 	syscall
       		move $s3, $v0 # s3 = v0
		
		#print string enter input
		la $a0, strEnterinput #a0 = &strEnterinput
		li $v0, 4 # v0 = 4
		syscall
		
		#read string to get string input
		la $a0, 0($s3) #a0 = &stringbuffer
		la $a1, ($t9) #a1 = len of string
		li $v0, 8 #scanf("%c", &string)
		syscall
		
		#la $s3, stringbuffer #okunan input adresi => a = &s3
		li $t2 4 # t2 = 4 len of first dimension
		
		jal print #It calls print function and then it comes back
		
		#This is counter for the loop
		add $s5, $zero, $zero # t=0 başlatır.
		
	loopx:
 		beq $s5, $s4, exitx # if(t0 == 4) go exit1
		
		jal putBomb #It calls putBomb function and then it comes back
		
		jal print #It calls print function and then it comes back
		
		addi $s5, $s5, 1 #s5 = s5 + 1
		
		beq $s5, $s4, exitx # if(t0 == 4) go exit1
		
		jal detonateBomb #It calls detonateBomb function and then it comes back
		
		jal print #It calls print function and then it comes back
		
		addi $s5, $s5, 1 #s5 = s5 + 1

		j loopx #It jumps loopx label
	exitx:
		
		

############################################################################
#                       Lab 3
#                       EC413
#
#    		Assembly Language Lab -- Programming with Loops.
#
############################################################################
#  DATA
############################################################################
        .data           # Data segment
Hello:  .asciiz " \n Hello World! \n "  # declare a zero terminated string
Hello_len: .word 16
AnInt:	.word	12		# a word initialized to 12
space:	.asciiz	" "	# declare a zero terminate string
WordAvg:   .word 0		#use this variable for part 4
ValidInt:  .word 0		#
ValidInt2: .word 0		#
lf:     .byte	10, 0	# string with carriage return and line feed
InLenW:	.word   4       # initialize to number of words in input1 and input2
InLenB:	.word   16      # initialize to number of bytes in input1 and input2
        .align  4
Input1:	.word	0x01020304,0x05060708
	    .word	0x090A0B0C,0x0D0E0F10
        .align  4
Input2: .word   0x01221117,0x090b1d1f   # input
        .word   0x0e1c2a08,0x06040210
        .align  4
Copy:  	.space  0x80    # space to copy input word by word
        .align  4
 
Enter: .asciiz "\n"
Comma: .asciiz ","
count:  .word   40
############################################################################
#  CODE
############################################################################
        .text                   # code segment
#
# print out greeting
#
main:
        la	$a0,Hello	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string

	
#Code for Item 2
#Count number of occurences of letter "l" in Hello string

li $t1, 0  # l count
li $t2, 'l' # Initialize l in register
li $t3, '!' # Initialize !, which is the end of the string in register.

loop:
    lb $s0, 0($a0)                    #load byte
    beq $s0, $t3, done          #if equal done
    addi $a0, $a0, 1             #counter up
    beq $s0, $t2, equ              #if equal move to equ
    j loop
     
equ: 
    addi $t1, $t1, 1          #iterate
    j loop

done:
    li $v0, 1                           #print function
    move $a0, $t1
    syscall


################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
################################################################################

#
# Code for Item 3 -- 
# Print the integer value of numbers from 0 and less than AnInt
#

li $a1, 0               #counter
lw $a2, AnInt       #load Anint number


loop1:
    beq $a1, $a2, done1    #if equal move to done1
    bne $a1, $a2, eq      # if not equal move to eq
    j loop1
    
eq:
    li $v0, 1           #print function
    move $a0, $a1       
    syscall              
    addi $a1, $a1, 1        #counter up
    j loop1

done1:


###################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
###################################################################################
#
# Code for Item 4 -- 
# Print the integer values of each byte in the array Input1 (with spaces)
#

la $s0, Input1
lb $t0, 0($s0)
lb $s1, space

loop2:
    move $a0, $t0       #print function
    li $v0, 1
    syscall

    addi $t0, $t0, 1           #iterate
    beq  $s1, $t0, done2         #if equal move to done

    la $a0, space           #print function
    li $v0, 4
    syscall

    j loop2

done2:


###################################################################################
#
# Code for Item 5 -- 
# Write code to copy the contents of Input2 to Copy
#

la $s2, Copy
la $s0, Input2
li $t3, 0
loop43:
        lw $t1, ($s0)             #load word
        sw $t1, 0($s2)            #store to Copy
        lw $t2, ($s2)            #load again
        addi $s2, $s2, 4          #iterate from here
        addi $s0, $s0, 4
        addi $t3, $t3, 1
        beq $t3, 32, end43
        j loop43
end43:  


#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
###################################################################################
#
# Code for Item 6 -- 
# Print the minimum, maximum, and integer average of the contents of array Input1
#

li $t6, 0
la $s1, Input1 
la $s2, Input1 

newc:
    lw $t1, 0($s1)
    lw $t2, 4($s1) 
    beq $t6, 32, pmm
    slt $t3, $t1, $t2      #compare
    beq $t3, 1, ns        #if comparison equals 1 then noswap
    beq $t3, $zero, s       # if comparison equals 0 then swap
    beq $t2, $t1, ns 
    j newc

s:  
    sw $t1, 4($s1)            # swap func
    sw $t2, 0($s1)
    addi $t6, $t6, 1 
    j newc

ns: 
    sw $t1, 0($s1)      #no swap func
    sw $t2, 4($s1)
    addi $t6, $t6, 1 
    j newc 

pmm: 
    la $t0, Input1         #print the stuff from here
    lw $t4, 0($t0) 
    lw $t5, 128($t0) 
    move $a0, $t4 
    li $v0 1 
    syscall

    la $a0, space 
    li $v0, 4 
    syscall

    move $a0, $t5 
    li $v0 1 
    syscall 

    la $a0, space 
    li $v0, 4 
    syscall

    add $s4, $t4, $t5 
    div $s4, $s4, 2  
    move $a0, $s4 
    li $v0, 1 
    syscall 

#################################################################################
        la	$a0,Enter	# address of string to print
        li	$v0,4		# system call code for print_str
        syscall                 # print the string
##################################################################################
#
# Code for Item 7 -- 
# Display the first 30 integers that are divisible by either 7 and 13 (with comma)
#

li $t0, 30
li $t1, 0
li $t2, 7
li $t3, 13

loop7:
    beq $t1, $t0, done7     #if equal goto done
    div $t1, $t2            # div
    mfhi $t4                  #remainder 
    beq $t4, 0, equi        #goto equi if equal
    div $t1, $t3
    mfhi $t4
    beq $t4, 0, equi
    add $t1, $t1, 1        #iterate by 1
    j loop7                 #jump to loop


equi:
    move $a0, $t1
    li $v0, 1
    syscall
    la $a0, Comma
    li $v0, 4
    syscall
    add $t1, $t1, 1
    j loop7

done7:


#
# Code for Item 8 -- 
# Repeat step 7 but display the integers in 6 lines with 5 integers with spaces per line
# This must be implemented using a nested loop.
#

li  $t0, 30       # Max num
li  $t1, 0          # starting number
li  $t2, 7          
li  $s5, 13          
li  $s4, 0         #counter
li  $s6, 5

lp1a:
    div $s4, $s6
    mfhi $t4             #remainder
    beq $t4, 0, adl

lp1b:
    beq $s4, $t0, donez   
    div $t1, $t2        
    mfhi    $t4         # remainder divided by 3
    beq $t4, 0, equz      
    div $t1, $s5       
    mfhi    $t4         
    beq $t4, 0, equz     
    add $t1, $t1, 1     # increment by 1
    j   lp1b

equz:
    move $a0, $t1        # load answer into $a0
    li  $v0, 1          
    syscall
    la	$a0,space	
    li	$v0,4		
    syscall            # print
    add $t1, $t1, 1     # increment by 1
    add $s4, $s4, 1     # increment counter
    j   lp1a              #jump back

adl:
    la	$a0,Enter	
    li	$v0,4		
    syscall             #print
    j lp1b               #jump back

donez:


Exit:
	jr $ra
.text
.globl main


la $a0, copy      # Loads string buffer's base address into $a0
li $a1, 21              # Loads the buffer's size into $a1 (including '\0')

li $v0, 8               # Loads the "read string" instruction code into $v0
syscall                 # System call to read a string

li $v0, 4               # Loads the "print string" instruction code into $v0
syscall
li $v0, 4              # Loads the string printing instruction code (4) in $v0
            la $a0, endl           # $a0 points to endl
            syscall
li $t1,  0            # Counter for string

while:      lbu  $a0, copy($t1) # Load a character
            beqz $a0, exit
            li $v0, 11              # Loads the "print string" instruction code into $v0
            syscall
            addi $t1, $t1, 1      # Increment counter
            li $v0, 4              # Loads the string printing instruction code (4) in $v0
            la $a0, endl           # $a0 points to endl
            syscall
            j while               # Repeat while loop

# end:        li $t2, 0
#             sb $t2, copy($t1)     # Append end character to copied string
#             la $a0, copy          # Display copy
#             li $v0, 4
#             syscall

exit:       li $v0, 10            # Loads the "exit" instruction into $v0
            syscall               # System call to terminate the program

.data

string: .asciiz "Mary had a little lamb"
copy:   .space  80
endl:   .asciiz "\n"
#################################################
#												#
#				text segment					#
#												#
#################################################

	.text
	.globl __start
__start:		l.s $f0, x
			l.s $f1, y
			mul.s $f12, $f0, $f1
print_1st:		jal print_float	
			jal printEndl
			
			lwc1 $f0, x ($gp)
			lwc1 $f1, m_inf ($gp)
			mul.s $f12, $f0, $f1			
print_2nd:		jal print_float	
			jal printEndl
			
			lwc1 $f0, y ($gp)
			lwc1 $f1, zer_f ($gp)
			div.s $f12, $f0, $f1
print_3rd:		jal print_float	
			jal printEndl
			
			lwc1 $f0, zer_f ($gp)
			lwc1 $f1, zer_f ($gp)
			div.s $f12, $f0, $f1
print_4th:		jal print_float	
			jal printEndl
			
			lwc1 $f0, zer_f ($gp)
			lwc1 $f1, p_inf ($gp)
			mul.s $f12, $f0, $f1
print_5th:		jal print_float	
			jal printEndl
			
			lwc1 $f0, p_inf ($gp)
			lwc1 $f1, m_inf ($gp)
			div.s $f12, $f0, $f1
print_6th:		jal print_float	
			jal printEndl
			
			lwc1 $f0, p_inf ($gp)
			lwc1 $f1, m_inf ($gp)
			add.s $f12, $f0, $f1
print_7th:		jal print_float	
			jal printEndl
			
			lwc1 $f0, x ($gp)
			lwc1 $f1, nan ($gp)
			add.s $f12, $f0, $f1
print_8th:		jal print_float	
			jal printEndl
			
Exit:		li		$v0, 10
			syscall	
print_float:	li		$v0, 2
		syscall
		jr $ra
printEndl:      la $a0, Endl
		li $v0, 4
		syscall	
		jr $ra	
.data
zer_f:   .float 0.0
m_inf:   .float 1.0
p_inf:   .float 2.0
nan:     .float nan
x:       .float 55
y:       .float -55
Endl: .asciiz "\n"

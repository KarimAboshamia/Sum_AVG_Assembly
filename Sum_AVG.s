#gcc -O3 -o Assignment.exe Assignment.s -m32
.section .data
input: .asciz "%d"    
inputDouble: .asciz "%lf"
outputDouble: .asciz "Sum is: %f\n"
outputDouble2: .asciz "Avg is: %f\n"
n: .int 0  
s: .double 0.0
operation: .double 0.0

.section .text        
.globl _main          
_main:
   pushl $n           
   pushl $input       
   call _scanf        
   add $8, %esp    

   movl $0, %ecx 

sumLoop:
   pushl %ecx

   pushl $s + 4       
   pushl $s
   pushl $inputDouble      
   call _scanf        
   add $12, %esp

   fldl s
   faddl operation
   fstpl operation

   popl %ecx
   addl $1, %ecx

   cmpl %ecx, n       
   ja sumLoop

   pushl operation + 4
   pushl operation
   pushl $outputDouble
   call _printf
   add $12, %esp

   fldl operation
   fidivl n
   fstpl operation

   pushl operation + 4
   pushl operation
   pushl $outputDouble2
   call _printf
   add $12, %esp
   
   ret

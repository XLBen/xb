@R1
D=M
@SET_ZERO
D;JLE        
@R2
M=0
@R0
D=M
@R3
M=D          

@R1
D=M
@R4
M=D          

(LOOP)
@R3
A=M          
D=M

@R2
M=M+D

@R3
M=M+1

@R4
M=M-1
D=M
@LOOP
D;JGT        

@END
0;JMP

(SET_ZERO)

@R2
M=0

(END)

@END
0;JMP
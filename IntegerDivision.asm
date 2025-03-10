(INTEGER_DIVISION)
    @R1
    D=M
    @INVALID_DIVISION
    D;JEQ            
    @0
    D=A
    @R4
    M=D
    @R0
    D=M
    @X_POSITIVE
    D;JGE
    @R7
    M=-1             
    @CHECK_Y_SIGN
    0;JMP
(X_POSITIVE)
    @R7
    M=1              

(CHECK_Y_SIGN)
    @R1
    D=M
    @Y_POSITIVE
    D;JGE
    @R8
    M=-1             
    @ABS_VALUES
    0;JMP
(Y_POSITIVE)
    @R8
    M=1              

(ABS_VALUES)
    @R0
    D=M
    @x_ABS
    M=D              
    @R7
    D=M
    @SKIP_NEGATE_X
    D;JGT            
    @x_ABS
    M=-M             
(SKIP_NEGATE_X)

    @R1
    D=M
    @y_ABS
    M=D              
    @R8
    D=M
    @SKIP_NEGATE_Y
    D;JGT            
    @y_ABS
    M=-M             
(SKIP_NEGATE_Y)
    @0
    D=A
    @quotient
    M=D              
    @x_ABS
    D=M
    @remainder
    M=D              

(DIVISION_LOOP)
    @remainder
    D=M
    @y_ABS
    D=D-M
    @END_DIVISION
    D;JLT            

    @y_ABS
    D=M
    @remainder
    M=M-D            
    @quotient
    M=M+1            
    @DIVISION_LOOP
    0;JMP

(END_DIVISION)
    @R7
    D=M
    @R8
    D=D-M
    @SAME_SIGN
    D;JEQ
    @quotient
    M=-M             
(SAME_SIGN)
    @R7
    D=M
    @ADJUST_REMAINDER
    D;JGT            
    @remainder
    M=-M             
(ADJUST_REMAINDER)
    @quotient
    D=M
    @R2
    M=D             
    @remainder
    D=M
    @R3
    M=D              
    @END
    0;JMP

(INVALID_DIVISION)
    @1
    D=A
    @R4
    M=D             
    @0
    D=A
    @R2
    M=D              
    @R3
    M=D              

(END)
    @END
    0;JMP           
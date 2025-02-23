.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'Enter a hex digit: $'
    DONG2 DB 'In decimal it is: $'
    XUONGD DB 13,10,'$'
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9
        LEA DX, DONG1
        INT 21H
        
        MOV AH, 1
        INT 21H
        MOV BL, AL
        
        MOV AH, 9
        LEA DX, XUONGD
        INT 21H
        
        MOV AH, 9
        LEA DX, DONG2
        INT 21H
       
        MOV AH, 2
        MOV DL, 31H
        INT 21H
        
        SUB BL, 11H
        MOV AH, 2
        MOV DL, BL
        INT 21H
        
        MOV AH, 04CH
        INT 21H
        
    MAIN ENDP
END MAIN
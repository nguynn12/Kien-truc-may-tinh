.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'ENTER THREE INITIALG: $'
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
        
        INT 21H
        MOV CL, AL
        
        INT 21H
        MOV BH, AL
        
        MOV AH, 9
        LEA DX, XUONGD
        INT 21H
        
        MOV AH, 2
        MOV DL, BL
        INT 21H
        
        MOV AH, 9
        LEA DX, XUONGD
        INT 21H
        
        MOV AH, 2
        MOV DL, CL
        INT 21H
        
        MOV AH, 9
        LEA DX, XUONGD
        INT 21H
        
        MOV AH, 2
        MOV DL, BH
        INT 21H
        
        MOV AH, 9
        LEA DX, XUONGD
        INT 21H
        
        MOV AH, 04CH
        INT 21H
            
    MAIN ENDP
END MAIN
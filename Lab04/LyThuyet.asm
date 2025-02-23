.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'HAY NHAP MOT KY TU: $'
    XUONGD DB 13, 10, '$'

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX    
        
        BATDAU:
        
        MOV AH, 9
        LEA DX, DONG1
        INT 21H
        
        MOV AH, 1
        INT 21H
        
        CALL KIEMTRA
        
        MOV AH, 04CH
        INT 21H
        
    MAIN ENDP
    
    KIEMTRA PROC
    
        CMP AL, 021H
        JB LAPLAI
        
        CMP AL, 0FEH
        JA LAPLAI
        
        CMP AL, 0DH
        JE LAPLAI
        
        RET
        
        LAPLAI:
        
        MOV AH, 9
        LEA DX, XUONGD
        INT 21H
        
        JMP BATDAU
           
    KIEMTRA ENDP    
    
END MAIN
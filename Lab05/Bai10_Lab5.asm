.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'NHAP CHIEU DAI HINH CHU NHAT: $'
    DONG2 DB 'NHAP CHIEU RONG HINH CHU NHAT: $'
    DONG3 DB 'DIEN TICH HINH CHU NHAT: $'
    DONG4 DB 'CHU VI HINH CHU NHAT: $'
    XUONGD DB 13, 10, '$'
    DAI DB ?
    RONG DB ?
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX    
        
        MOV AH, 9
        LEA DX, DONG1
        INT 21H
        
        CALL NHAP
        
    MAIN ENDP
    
    NHAP PROC
        
        XOR BX, BX
        
        LAPNHAP:
        
            MOV AH, 1
            INT 21H
            
            CMP AL, 0DH
            JE TIEPTUC
            
            SUB AL, 030H
            
            MOV DAI, AL
            
            MOV AX, BX
            
            MOV CX, 10
            
            MUL CX
            
            MOV DL, KYTU
            
            ADD AX, DX
            
            MOV BX, AX
            
            JMP LAP    
        
    NHAP ENDP
    
END MAIN
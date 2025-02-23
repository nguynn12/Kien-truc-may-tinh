.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'NHAP SO NHI PHAN(0/1): $'
    DONG2 DB 'SO NHI PHAN VUA NHAP: $'
    XUONGD DB 13, 10, '$'
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        XOR BX, BX
        
        MOV AH, 9
        LEA DX, DONG1
        INT 21H
        
        MOV CX, 0
        
        NHAP:
        
            MOV AH, 1
            INT 21H
            
            CMP AL, 0DH
            JE TIEPTUC
            
            CMP AL, '0'
            JL NHAP
            
            CMP AL, '1'
            JG NHAP
            
            SUB AL, 30H
            
            SHL BX, 1
            
            OR BL, AL
        
            INC CX
        
            CMP CX, 16
            JE TIEPTUC 
        
            JMP NHAP
        
        TIEPTUC:
        
            MOV AH, 9
            LEA DX, XUONGD
            INT 21H
            
            LEA DX, DONG2
            INT 21H
            
            CMP CX, 16
            JE XUAT
        
            MOV DX, 16
            
            SUB DX, CX
            
            DICH:
            
                SHL BX, 1
            
                DEC DX
                
                CMP DX, 0
                JNE DICH
        
        XUAT:
        
            ROL BX, 1
            JC XUATSO1
            
            MOV AH, 2
            MOV DL, '0'
            INT 21H
            
            JMP KETTHUC
            
                XUATSO1:
                
                    MOV AH, 2
                    MOV DL, '1'
                    INT 21H
                    
        KETTHUC:
        
            DEC CX
            
            CMP CX, 0
            JNE XUAT
            
        MOV AH, 04CH
        INT 21H
                
    MAIN ENDP
END MAIN
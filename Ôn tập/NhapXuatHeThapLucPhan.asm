.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'NHAP SO THAP LUC PHAN (TOI DA 16 BIT): $'
    DONG2 DB 'SO THAP LUC PHAN VUA NHAP: $'
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
        
        CALL NHAP
        
        MOV AH, 9
        LEA DX, XUONGD
        INT 21H
        
        LEA DX, DONG2
        INT 21H
        
        CALL XUAT
        
        MOV AH, 04CH
        INT 21H    
        
    MAIN ENDP
    
    
    NHAP PROC
        
        MOV AH, 1
        INT 21H
        
        CMP AL, 0DH
        JE BATDAUNHAP
        
        CMP AL, '0'
        JL NHAP
        
        CMP AL, 'f'
        JG NHAP
        
        CMP AL, '9'
        JLE LASO
        
        CMP AL, 'A'
        JL NHAP
        
        CMP AL, 'F'
        JLE LACHU
        
        CMP AL, 'a'
        JL NHAP
        
        CMP AL, 'f'
        JLE LACHU
        
            LASO:
            
                SUB AL, 30H
                
                JMP DICH
                
            LACHU:
            
                CMP AL, 'a'
                JL CHUHOA 
            
                SUB AL, 57H
                JMP DICH 
                
                CHUHOA:
                
                SUB AL, 37H
                JMP DICH        
                
        DICH:
        
            SHL BX, 4
            
            OR BL, AL
            
            INC CX
            
            CMP CX, 4
            JNE NHAP
        
        BATDAUNHAP:    
        RET                        
        
    NHAP ENDP
    
    
    XUAT PROC
        
        CMP CX, 4
        JE TIEPTUC
        
        MOV AX, 4
        
        MUL CX        
        
        MOV DX, 16
        
        SUB DX, AX
        
            DICHBIT:
            
                SHL BX, 1
                
                DEC DX
                
                CMP DX, 0
                JNE DICHBIT
        
        TIEPTUC:
        
            MOV DL, BH
            
            SHR DL, 4
            
            CMP DL, 9
            JG XUATCHU
            
            ADD DL, 30H
            
            MOV AH, 2
            INT 21H
            
            JMP KETTHUC
            
            
                XUATCHU:
                
                    ADD DL, 37H
                    
                    MOV AH, 2
                    INT 21H
                    
        KETTHUC:
        
            SHL BX, 4
            
            LOOP TIEPTUC
            
        RET    
        
    XUAT ENDP
    
END MAIN
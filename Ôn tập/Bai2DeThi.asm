.MODEL SMALL
.STACK 100H
.DATA

    TB1 DB 'Hay nhap mot chu hoa thu 1(A-Z): $'
    TB2 DB 'Hay nhap mot chu hoa thu 2(A-Z): $'
    TB3 DB 'Ket qua: $'
    
    XUONGD DB 13, 10, '$'
    
    SOTHU1 DB ?
    SOTHU2 DB ?
    SOLAN DB ?
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        NHAP1:          ;NHAP SO THU 1
            
            XOR BX, BX
            XOR CX, CX
        
            MOV AH, 9       ;IN THONG BAO 1
            LEA DX, TB1
            INT 21H
            
            MOV AH, 1       ;NHAP KY TU
            INT 21H
            
            MOV SOTHU1, AL  ;DUA VAO BIEN TAM
            
            MOV AH, 9       ;XUONG DONG
            LEA DX, XUONGD
            INT 21H
            
            MOV BL, SOTHU1  ;BL CHUA SO THU 1
            
            ;NEU NHAP NGOAI PHAM VI TU 0 DEN 9, NHAP LAI
            CMP BL, 'A'
            JB NHAP1
            
            CMP BL, 'Z'
            JA NHAP1
            
            
        NHAP2:          ;NHAP SO THU 2
        
        
            LEA DX, TB2     ;IN THONG BAO 2
            INT 21H
            
            MOV AH, 1       ;NHAP KY TU
            INT 21H
            
            MOV SOTHU2, AL  ;DUA VAO BIEN TAM
            
            MOV AH, 9       ;XUONG DONG
            LEA DX, XUONGD
            INT 21H
            
            MOV CL, SOTHU2  ;CL CHUA SO THU 2
            
            ;NEU NHAP NGOAI PHAM VI TU 0 DEN 9, NHAP LAI
            
            CMP CL, 'A'
            JB NHAP2
            
            CMP CL, 'Z'
            JA NHAP2
            
        CMP BL, CL      ;NEU 2 SO GIONG NHAU, NHAP LAI TU DAU
        JE NHAP1
        
        ;========= KET QUA =========;
        
        LEA DX, TB3
        INT 21H
        
        ;NEU BL BE HON CL, NHAY DEN NHAN 'CLTRUBL'
        
        CMP BL, CL
        JB CLTRUBL
        
        SUB BL, CL
        
        CMP BL, 1
        JE NHAP1
        
        DEC BL
        
        MOV DL, CL
        INC DL
        
        MOV CL, BL
        
        JMP XUAT
        
            CLTRUBL:
            
            ;LAY CL TRU BL, ROI TRU 1 => SO LAN LAP
            
                SUB CL, BL
                
                CMP CL, 1
                JE NHAP1
                
                DEC CL
                
                MOV DL, BL
                INC DL
                
        XUAT:
             
            MOV AH, 2
            INT 21H
            
            INC DL 
                                                       
            LOOP XUAT
            
        MOV AH, 04CH
        INT 21H
        
    MAIN ENDP
END MAIN
.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'NHAP MOT KY TU: $'
    XUONGD DB 13, 10, '$'    

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9           ;IN DONG 1               
        LEA DX, DONG1
        INT 21H
        
        XOR BX, BX          ;XOA THANH GHI BX
        
        KIEMTRA:
        
            MOV AH, 01H     ;NHAP KY TU 
            INT 21H
            
            CMP AL, 0DH     ;NEU KY TU NHAP LA ENTER,
                          
            JE KETTHUC      ;KET THUC CHUONG TRINH
            
            CMP AL, '0'     ;NEU KY TU NHAP NHO HON KY TU ASCII
                            ;'0', NHAY LAI NHAN 'KIEMTRA'
            JB KIEMTRA
            
            CMP AL, '1'     ;NEU KY TU NHAP LON HON KY TU ASCII
                            ;'1', NHAY LAI NHAN 'KIEMTRA'
            JA KIEMTRA
            
            SHL BX, 1       ;NEU KY TU NHAP LA '0' HOAC '1',
                            ;DICH TRAI GIA TRI THANH GHI BX DE THEM
                            
                            ;BIT MOI VAO LSB CUA THANH GHI BX
            
            CMP AL, '1'     ;NEU KY TU NHAP KHAC '1', NHAY LAI NHAN
                            ;'KIEMTRA' DE NHAP LAI KY TU
                             
            JNE KIEMTRA     
            
            OR BX, 1        ;NEU KY TU NHAP LA '1', DAT BIT THAP NHAT
                            ;CUA THANH GHI BX BANG 1 (LENH OR)
           
        LOOP KIEMTRA        ;LAP LAI NHAN 'KIEMTRA'
        
        KETTHUC:            ;NHAN 'KET THUC'
        
        MOV AH, 04CH        ;KET THUC CHUONG TRINH
        INT 21H    
        
    MAIN ENDP
END MAIN
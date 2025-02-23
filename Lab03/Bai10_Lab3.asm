.MODEL SMALL
.STACK 100H
.DATA
    
    DONG1 DB 'NHAP SO NHI PHAN (0/1): $'
    DONG2 DB 'SO NHI PHAN VUA NHAP: $'
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
                          
            JE XUAT         ;NHAY DEN NHAN 'XUAT'
            
            CMP AL, '0'     ;NEU KY TU NHAP NHO HON KY TU ASCII
                            ;'0', NHAY LAI NHAN 'KIEMTRA'
            JB KIEMTRA
            
            CMP AL, '1'     ;NEU KY TU NHAP LON HON KY TU ASCII
                            ;'1', NHAY LAI NHAN 'KIEMTRA'
            JA KIEMTRA
            
            SHL BX, 1       ;NEU KY TU NHAP LA '0' HOAC '1',
                            ;DICH TRAI GIA TRI THANH GHI BX DE THEM
                            
                            ;BIT MOI VAO LSB CUA THANH GHI BX
            
            CMP AL, '1'     ;NEU KY TU NHAP LA '0', NHAY LAI NHAN
                            ;'KIEMTRA' DE NHAP KY TU TIEP THEO
                             
            JNE KIEMTRA     
            
            OR BX, 1        ;NEU KY TU NHAP LA '1', DAT BIT THAP NHAT
                            ;CUA THANH GHI BX BANG 1 (LENH OR)
           
        LOOP KIEMTRA        ;LAP LAI NHAN 'KIEMTRA'
        
        XUAT:               ;NHAN 'XUAT'
        
        MOV AH, 9           ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        LEA DX, DONG2       ;IN DONG 2
        INT 21H
        
        MOV CX, 16          ;LAP LAI 16 LAN (16 BIT)
        
        HIENTHI:            ;NHAN 'HIENTHI'

            ROL BX, 1       ;QUAY TRAI THANH GHI BX, DE LAY
                            ;BIT LSB VAO CF
                            
            JC HIENTHI1     ;NEU CO CF = 1, NHAY DEN NHAN
                            ;'XUAT1'
                
            MOV DL, '0'     ;NEU CO CF = 0, HIEN THI SO '0'
            MOV AH, 2
            INT 21H
            
            JMP THOAT       ;SAU DO NHAY DEN NHAN 'THOAT'
                
            HIENTHI1:       ;NHAN 'HIENTHI1'
            
            MOV DL, '1'     ;HIEN THI SO '1'
            MOV AH, 2
            INT 21H
            
            THOAT:          ;NHAN 'THOAT'
            
            DEC CX          ;MOI LAN CHAY, GIAM GIA TRI
                            ;THANH GHI CX DI 1
                            
            CMP CX, 0       ;SO SANH GIA TRI THANH GHI CX VOI
                            ;SO 0
            
            JNE HIENTHI     ;NEU CX KHAC 0, NHAY DEN NHAN 
                            ;'HIENTHI' DE LAP LAI CHO DEN
                            
                            ;KHI BANG 0
           
        MOV AH, 04CH        ;KET THUC CHUONG TRINH
        INT 21H
        
    MAIN ENDP
END MAIN
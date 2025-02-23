.MODEL SMALL
.STACK 100H
.DATA
    
    DONG1 DB 'NHAP SO NHI PHAN (0/1, TOI DA 16 BIT): $'
    DONG2 DB 'SO NHI PHAN VUA NHAP: $'
    XUONGD DB 13, 10, '$'
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9           ;IN DONG 1               
        LEA DX, DONG1
        INT 21H
        
        XOR BX, BX          ;XOA GIA TRI THANH GHI BX
        
        MOV CX, 0           ;LUU SO LAN NHAP KY TU
        
        NHAP:
        
        MOV AH, 1           ;NHAP KY TU
        INT 21H
        
        CMP AL, 0DH         ;SO SANH KY TU NHAP VAO VOI KY TU
                            ;'ENTER' (HE 16 LA 0DH)
                            
        JE XUAT             ;NEU BANG, NHAY DEN NHAN 'XUAT'
        
        CMP AL, '0'         ;NT
        
        JB NHAP             ;NEU KY TU NHAP NHO HON 0, 
                            ;NHAP LAI
        
        CMP AL, '1'         ;NT
        
        JA NHAP             ;NEU KY TU NHAP LON HON 1, 
                            ;NHAP LAI
        
        AND AL, 0FH         ;LAY 4 BIT CUOI CUNG CUA THANH GHI AL
        
        SHL BX, 1
        
        OR BL, AL           ;GAN 4 BIT CUOI DO VAO THANH GHI BL
        
        INC CX              ;TANG CX LEN DE DEM SO LAN NHAP
        
        CMP CX, 16          ;NT
        
        JE XUAT             ;NEU CX = 16, NHAY DEN NHAN 'XUAT'
        
        JMP NHAP            ;CON KHONG THI NHAP CHO DEN KHI DU
        
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
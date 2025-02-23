.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'NHAP SO NHI PHAN(0, 1): $'
    DONG2 DB 'SO NHI PHAN DA NHAP: $'
    XUONGD DB 13, 10, '$'
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        XOR BX, BX      ;XOA THANH GHI
        
        MOV CX, 0       ;LUU SO LAN NHAP
        
        MOV AH, 9       ;IN DONG 1
        LEA DX, DONG1
        INT 21H 
        
        ;============ NHAP ============;
        
        NHAP:
        
        MOV AH, 1       ;NHAP KY TU
        INT 21H
        
        CMP AL, 0DH     ;NEU KY TU NHAP LA ENTER         
        JE TIEPTHEO     ;THI NHAY TOI NHAN 'TIEPTHEO'
        
        CMP AL, '0'     ;NEU KY TU NHAP KHAC '0'     
        JB NHAP         ;THI NHAP LAI
        
        CMP AL, '1'     ;NEU KY TU NHAP KHAC '1'
        JA NHAP         ;THI NHAP LAI
        
        SUB AL, 30H     ;TRU GIA TRI THANH GHI AL DI 30
                        ;DE CHUYEN VE SO
                        
        SHL BX, 1       ;MOI LAN NHAP, DICH TRAI THANH GHI
                        ;BX DI 1 LAN DE LUU GIA TRI
                        
        OR BL, AL       ;VI GIA TRI DUOC LUU O AL NEN TA
                        ;DUNG LENH LUAN LY OR DE DUA VAO BL
        
        INC CX          ;MOI LAN NHAP, TANG CX LEN DE DEM SO
                        ;LUONG KY TU DA NHAP
                        
        CMP CX, 16      ;NEU NHU CHUA NHAP HET 16 KY SO, THI
                        ;NHAP TIEP
        JNE NHAP
        
        
        ;============ DICH BIT DE XUAT ============;
        
        ;NEU NGUOI DUNG NHAP DU 16 KY SO, KHI XUAT TA XUAT 16 KY SO
        
        ;CON KHONG, NEU NGUOI DUNG NHAP BE HON 16 KY SO. GIA SU NHAP 4
        ;KY SO, THI MUON XUAT 4 KY SO NAY (LUU O BL), PHAI DICH 12 LAN
        
        ;DE 4 KY SO NAY DUNG O VI TRI DAU TIEN (BH). DE BIET SO LAN PHAI
        ;DICH, DON GIAN CHI CAN LAY 16 - SO LUONG DA NHAP
        
        ;VI DU: NHAP 4 KY SO THI LAY 16 - 4 = 12 (SO LAN PHAI DICH)
        
        TIEPTHEO:
        
        CMP CX, 16      ;NEU NHAP DU 16 KY SO, THI NHAY DEN
        
                        ;NHAN 'TIEUDE' LUON, KHONG CAN PHAI DICH
        JE TIEUDE
        
        MOV DX, 16      ;CHO DX = 16 DE TINH SO LAN PHAI DICH
        
        SUB DX, CX      ;LAY DX-CX ROI LUU VAO DX (COI NHU SO
                        ;LAN DICH LUU O DX)
        
        DICH:
        
        SHL BX, 1       ;DICH BX DI 1 LAN DE DUA CAC KY SO LEN TREN DAU
        
        DEC DX          ;MOI LAN DICH, GIAM DX DE DEM SO LAN CON LAI PHAI DICH
        
        CMP DX, 0       ;NEU NHU DX KHAC 0 (NGHIA LA VAN CON PHAI DICH), THI
                        ;DICH CHO DEN KHI DX=0
        JNE DICH
        
        TIEUDE:
        
        MOV AH, 9       ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        LEA DX, DONG2   ;IN DONG 2
        INT 21H
        
        ;============ XUAT ============;
        
        XUAT:           ;NHAN XUAT
             
        ROL BX, 1       ;MOI LAN XUAT, QUAY PHAI THANH GHI BX 1 LAN DE LUU GIA TRI
                        ;CUA LSB VAO CO CF (NEU KY SO LA SO '1', THI KHI QUAY PHAI
                        
                        ;LSB=1, SAU DO CF=1
        
        JC INSO1        ;NEU CO CF=1, IN SO '1'
        
        MOV AH, 2       ;CON KHONG THI IN SO '0'
        MOV DL, '0'
        INT 21H
        
        JMP KIEMTRA     ;KHI IN XONG KY SO NAO, THI NHAY DEN NHAN KIEMTRA
        
            INSO1:      ;NHAN 'INSO1'
            
            MOV AH, 2
            MOV DL, '1'
            INT 21H
        
        KIEMTRA:        ;NHAN 'KIEMTRA'        
            
        DEC CX          ;MOI LAN QUAY PHAI THANH GHI BX, GIAM GIA TRI CUA CX
                        ;DI 1 LAN DE BIET SO LAN PHAI QUAY
                        
                        ;GIA SU NHAP 4 KY SO, THI TA PHAI QUAY 4 LAN
        
        CMP CX, 0       ;NEU CX KHAC 0, THI QUAY LAI NHAN XUAT, THUC HIEN LAI
                        ;CAC BUOC XUAT (GOM CO DICH BX)
        JNE XUAT    
        
        MOV AH, 04CH    ;KET THUC CHUONG TRINH
        INT 21H         
        
    MAIN ENDP
END MAIN
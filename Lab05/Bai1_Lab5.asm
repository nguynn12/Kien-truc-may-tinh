.MODEL SMALL
.STACK 100H
.DATA
          
    DONG1 DB 'NHAP SO NHI PHAN (TOI DA 16 BIT): $'
    DONG2 DB 'SO NHI PHAN DA NHAP: $'
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
        
        NHAP:               ;NHAN 'NHAP'
        
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
        
        XUAT:               
        
                            ;NEU NHU CHI NHAP SO LUONG BIT NHO
                            ;16(VD: NHAP 4 KY TU), THI NEU NHU 
                            
                            ;QUAY TRAI THANH GHI BX, CHI LAY
                            ;4 BIT DAU (4 SO 0), KHI XUAT RA
                            
                            ;MAN HINH, CHI CO 4 SO 0. VI VAY,
                            ;SE CO CAC BUOC SAU DE GIAI QUYET
                            
                            ;VAN DE
                             
        
        MOV AX, 16          ;KHI NHAP XONG, CX=(SO LUONG BIT
                            ;NHAP), VAY DE LAY GIA TRI BYTE
                            
                            ;THAP CUA THANH GHI BX, PHAI DICH
                            ;TRAI (16 - SO LUONG BIT DA NHAP)
        SUB AX, CX
        
        DICH:               ;NHAN 'DICH' DE DICH TRAI THANH GHI
                            ;BX SO LAN MA GIA TRI THANH AX DANG
                            
                            ;CHUA
        
        SHL BX, 1           ;DICH TRAI THANH BX 1 LAN
        
        DEC AX              ;MOI LAN DICH, GIAM GIA TRI THANH GHI
                            ;AX 1 LAN
        
        CMP AX, 0           ;NEU AX KHAC 0, DICH CHO DEN KHI
                            ;AX=0 VA XUAT
        JNE DICH
        
        MOV AH, 9           ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        LEA DX, DONG2       ;IN DONG 2
        INT 21H
        
            LAP:
            
            ROL BX, 1       ;QUAY TRAI THANH GHI BX, BIT LSB
                            ;(LESS SIGNIFICANT BIT)
                            
                            ;LUU VAO CO CF
            
            JC HIENTHISO1   ;NEU CO CF = 1, NHAY DEN NHAN
                            ;'HIENTHISO1', CON KHONG (CF = 0),
                            
                            
            
            MOV AH, 2       ;HIEN THI SO '0'       
            MOV DL, '0'
            INT 21H
            
            JMP KIEMTRA     ;KHI HIEN THI XONG, NHAY DEN NHAN
                            ;'KIEMTRA'
            
            HIENTHISO1:     ;NHAN 'HIENTHISO1'
            
            MOV AH, 2
            MOV DL, '1'
            INT 21H
            
            KIEMTRA:        ;NHAN 'KIEMTRA'
            
            DEC CX          ;MOI LAN HIEN THI, GIAM GIA TRI
                            ;THANH GHI CX DI 1
            
            CMP CX, 0       ;NEU THANH GHI CX KHAC 0, LAP LAI
                            ;CHO DEN KHI CX = 0
            JNE LAP
            
    MOV AH, 04CH
    INT 21H
        
    MAIN ENDP
END MAIN
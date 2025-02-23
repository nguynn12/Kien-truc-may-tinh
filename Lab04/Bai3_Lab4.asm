.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'HAY NHAP MOT CHU THUONG (a-z): $'
    DONG2 DB 'CHU HOA TUONG UNG LA: $'
    XUONGD DB 13, 10, '$'
    KYTU DB ?

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        BATDAU:
        
        MOV AH, 9           ;IN DONG 1
        LEA DX, DONG1
        INT 21H
        
        MOV AH, 1           ;NHAP KY TU
        INT 21H
        MOV KYTU, AL
        
        CALL KIEMTRA        ;GOI THU TUC 'KIEMTRA'
        
        MOV AH, 9           ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        LEA DX, DONG2       ;IN DONG 2
        INT 21H
        
        MOV AH, 2           ;XUAT CHU HOA
        MOV DL, BL
        INT 21H
        
        MOV AH, 04CH        ;KET THUC CHUONG TRINH
        INT 21H    
        
    MAIN ENDP
    
    KIEMTRA PROC
        
        MOV AH, 9           ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        CMP KYTU, 'a'       ;SO SANH KY TU NHAP VAO (HE 16) VOI
                            ;GIA TRI HE 16 CUA KY TU ASCII 'a'
                            
                            
        JB BATDAU           ;NEU NHO HON, NHAP LAI 
        
        CMP KYTU, 'z'       ;NT
        JA BATDAU
        
        MOV BL, KYTU        ;DI CHUYEN BIEN KYTU NHAP VAO THANH
                            ;GHI BL
        
        SUB BL, 20H         ;TRU GIA TRI THANH GHI BL DI 20H
                            ;VI CHU HOA CACH CHU THUONG 20H
                            
        RET                 ;RETURN, QUAY LAI SAU LENH CALL
                            ;(O DAY LA CALL KIEMTRA)
        
    KIEMTRA ENDP
    
END MAIN
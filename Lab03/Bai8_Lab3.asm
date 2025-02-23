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
        
        BATDAU:             ;NHAN 'BATDAU'
        
        MOV AH, 9           ;IN DONG 1
        LEA DX, DONG1
        INT 21H
        
        MOV AH, 8           ;NHAP MOT KY TU (KHONG HIEN THI
                            ;RA MAN HINH)
        INT 21H
        MOV KYTU, AL
        
        MOV AH, 9           ;XUONG DONG
        LEA DX, XUONGD
        INT 21H

        CMP KYTU, 'a'       ;NEU KY TU NHAP VAO CO GIA TRI HE 16
                            ;NHO HON GIA TRI HE 16 CUA KY TU ASCII
                            ;'a'
                            
        JB BATDAU           ;NHAY LAI VAO NHAN 'BATDAU'
        
        CMP KYTU, 'z'       ;NT
        JA BATDAU
        
        MOV BL, KYTU        ;DI CHUYEN KYTU VAO BL
        
        MOV AH, 9           ;XUONG DONG
        LEA DX, XUONGD            
        INT 21H
        
        LEA DX, DONG2       ;IN DONG 2
        INT 21H
        
        MOV DL, BL          ;DI CHUYEN GIA TRI BL VAO DL
        SUB DL, 020H        ;TRU GIA TRI DL DI 020H (CHU THUONG
                            ;CO GIA TRI HE 16 CACH CHU HOA 20H)
        
        MOV AH, 2           ;HIEN THI KY TU (CHU HOA)
        INT 21H
        
        MOV AH, 04CH        ;KET THUC CHUONG TRINH
        INT 21H    
        
    MAIN ENDP
END MAIN    

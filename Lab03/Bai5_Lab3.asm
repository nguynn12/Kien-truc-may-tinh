.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'NHAP MOT KY TU: $'
    DONG2 DB 'NAM KY TU DUNG TRUOC: $'
    XUONGD DB 13, 10, '$'
    XUONG DB 10, '$'
    KYTU DB ?

.CODE
    MAIN PROC
        
        MOV AX, @DATA       
        MOV DS, AX
                                
        MOV AH, 9       ;IN DONG 1
        LEA DX, DONG1
        INT 21H
        
        MOV AH, 1       ;NHAP MOT KY TU
        INT 21H
        MOV KYTU, AL    
        
        MOV AH, 9       ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        LEA DX, DONG2   ;IN DONG 2
        INT 21H
        
        MOV DL, KYTU    ;DI CHUYEN KY TU VAO THANH GHI DL
        
        SUB DL, 5H      ;TRU GIA TRI DI 5 (5 KY TU DUNG TRUOC)
        
        MOV CX, 5       ;LAP LAI 5 LAN (5 KY TU)
        
        LAP:            ;NHAN 'LAP'
        
        MOV AH, 2       ;HIEN THI KY TU
        INT 21H
        
        MOV BL, DL      ;DI CHUYEN GIA TRI TU DL VAO BL
                        ;DE TRANH BI DE DU LIEU (DO 2 CAU LENH O DUOI)
        
        MOV AH, 9       ;XUONG DONG (KHONG VAO DAU DONG)
        LEA DX, XUONG
        INT 21H
        
        MOV DL, BL      ;DI CHUYEN GIA TRI TU BL VAO LAI DL
        
        INC DL          ;TANG GIA TRI CUA DL LEN (5 KY TU)
        
        LOOP LAP        ;LENH VONG LAP
        
        MOV AH, 04CH    ;KET THUC CHUONG TRINH
        INT 21H
    
    MAIN ENDP
END MAIN
.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'NHAP MOT KY TU: $'
    DONG2 DB 'NAM KY TU KE TIEP: $'
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
        
        MOV CX, 5       ;LAP LAI 5 LAN (5 KY TU)
        
        INC DL          ;TANG GIA TRI CUA DL LEN (DE HIEN
                        ;THI KY TU KE TIEP)
        
        LAP:            ;NHAN 'LAP'
        
        MOV AH, 2       ;HIEN THI KY TU
        INT 21H
        
        INC DL          ;TANG GIA TRI CUA DL LEN (DE HIEN
                        ;THI KY TU KE TIEP)
        
        MOV BH, DL      ;DI CHUYEN DL VAO BL (DE TRANH DE
                        ;DU LIEU)
        
        MOV AH, 9       ;XUONG DONG
        LEA DX, XUONG
        INT 21H
        
        MOV DL, BH      ;DI CHUYEN BL VAO DL (DE TRANH DE
                        ;DU LIEU)
        
        LOOP LAP        ;LENH VONG LAP
        
        MOV AH, 04CH    ;KET THUC CHUONG TRINH
        INT 21H
        
    MAIN ENDP
END MAIN    

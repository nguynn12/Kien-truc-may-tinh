.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'NHAP MOT KY TU: $'
    DONG2 DB 'NAM KY TU DUNG TRUOC: $'
    DONG3 DB 'NAM KY TU DUNG SAU: $'
    XUONGD DB 13, 10, '$'
    KYTU DB ?

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9           ;IN DONG 1
        LEA DX, DONG1
        INT 21H
        
        MOV AH, 1           ;NHAP MOT KY TU
        INT 21H
        MOV KYTU, AL
        
        MOV AH, 9           ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        LEA DX, DONG2       ;IN DONG 2
        INT 21H
        
        MOV CX, 5           ;SO LAN LAP (O DAY LA 5, DO IN RA 
                            ;5 KY TU)
                            
        MOV DL, KYTU        ;DI CHUYEN KY TU DA NHAP VAO DL
                            ;(DE TRANH DE DU LIEU)
                            
        SUB DL, 5           ;TRU GIA TRI CUA DL DI 5 (IN 5
                            ;KY TU TRUOC DO)
        
        LAP1:               ;NHAN 'LAP1'
        
        MOV AH, 2           ;HIEN THI KY TU
        INT 21H
        
        INC DL              ;TANG GIA TRI CUA DL LEN 1 (DE HIEN THI
                            ;KY TU KE TIEP)
        
        LOOP LAP1           ;LAP LAI NHAN 'LAP1'
        
        MOV BL, DL          ;DI CHUYEN DL VAO BL (DE TRANH
                            ;DE DU LIEU)
        
        MOV AH, 9           ;XUONG DONG
        LEA DX, XUONGD            
        INT 21H
        
        LEA DX, DONG3       ;IN DONG 3
        INT 21H
        
        MOV CX, 5           ;NT
        
        MOV DL, BL          ;NT
        
        INC DL              ;SAU KHI IN RA 5 KY TU DUNG TRUOC
                            ;(CO NGHIA LA TRU 5, ROI TANG LEN 5 LAI)
                            
                            ;, THI GIA TRI CUA DL HIEN TAI GIONG VOI
                            ;GIA TRI CUA BIEN KYTU, NEN TANG GIA TRI
                            
                            ;DL LEN 1 DE IN RA KY TU KE TIEP. NEU KHONG
                            ;THI KHI IN RA 5 KY TU KE TIEP, KY TU DAU TIEN
                            
                            ;SE BI TRUNG VOI BIEN KYTU NHAP TU BAN PHIM
                            
                            
        LAP2:               ;NHAN 'LAP2'
        
        MOV AH, 2           ;HIEN THI KY TU
        INT 21H
        
        INC DL              ;TANG GIA TRI CUA DL LEN 1 (DE HIEN THI
                            ;KY TU KE TIEP)
        
        LOOP LAP2           ;LAP LAI NHAN 'LAP2'
        
        MOV AH, 04CH        ;KET THUC CHUONG TRINH
        INT 21H
    
    MAIN ENDP
END MAIN
.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB '***********$'
    DONG2 DB '****$'
    XUONGD DB 13,10,'$'
    KYTU1 DB ?
    KYTU2 DB ?
    KYTU3 DB ?
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 2             ;IN KY TU "?"
        MOV DL, '?'
        INT 21H
        
        MOV AH, 1             ;NHAP KY TU I
        INT 21H
        MOV KYTU1, AL
        
        INT 21H               ;NHAP KY TU II
        MOV KYTU2, AL
        
        INT 21H               ;NHAP KY TU III
        MOV KYTU3, AL
        
        CALL LAP              ;GOI HAM LAP 
        
        LEA DX, XUONGD        ;XUONG DONG
        INT 21H
        
        LEA DX, DONG2         ;IN DONG 2
        INT 21H
        
        MOV AH, 2             ;HIEN THI KY TU I
        MOV DL, KYTU1
        INT 21H
        
        MOV DL, KYTU2         ;HIEN THI KY TU II
        INT 21H
        
        MOV DL, KYTU3         ;HIEN THI KY TU III
        INT 21H
        
        MOV AH, 9             ;IN DONG 2
        LEA DX, DONG2
        INT 21H
        
        CALL LAP              ;GOI HAM LAP 1 LAN NUA
        
        MOV AH, 04CH          ;KET THUC CHUONG TRINH
        INT 21H
        
    MAIN ENDP
    
        LAP PROC              ;HAM LAP
    
            MOV CX, 5         ;SO DEM TRONG VONG LAP                                 ;(O DAY LALAP LAI 5 LAN)
                              ;(O DAY TA LAP LAI 5 LAN)
                              
            LAPLAI:           ;NOI DUNG HAM LAP
    
            MOV AH, 9         ;XUONG DONG
            LEA DX, XUONGD
            INT 21H
            
            MOV AH, 9         ;IN DONG 1
            LEA DX, DONG1
            INT 21H
    
            LOOP LAPLAI       ;LAP LAI CHO DEN KHI NOI DUNG
                              ;THANH GHI CX GIAM TOI 0
                              
            RET               ;QUAY LAI TU LENH CALL DA GOI
                              ;HAM LAP NAY
                              
        LAP ENDP              ;KET THUC HAM LAP
    
END MAIN


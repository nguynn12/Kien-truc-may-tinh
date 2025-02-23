.MODEL SMALL
.STACK 100H
.DATA
.CODE
    MAIN PROC
    
        MOV AX, @DATA
        MOV DS, AX
        
        MOV CX, 26         ;SO LAN LAP CUA NHAN 'LAP'
                           ;(O DAY LA 26 VI LA SO LUONG 
                           ;CHU CAI)
         
        MOV DL, 41H        ;CHU CAI DAU TIEN (A), 41H LA 
                           ;GIA TRI HE 16 CUA KY TU ASCII 'A'
        
        LAP:
        
        MOV AH, 2          ;HIEN THI CAC CHU CAI
        INT 21H
        
        INC DL             ;TANG GIA TRI TRONG THANH GHI DL
                           ;DE HIEN THI TAT CA CHU CAI
                
        LOOP LAP           ;VONG LAP
        
        MOV AH, 04CH       ;KET THUC CHUONG TRINH
        INT 21H
        
    MAIN ENDP
END MAIN
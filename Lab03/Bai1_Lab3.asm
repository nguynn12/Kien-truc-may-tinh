.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'BAY GIO LA (S)ANG, (C)HIEU HAY (T)OI? $'
    BUOISANG DB 'CHAO BUOI SANG$'
    BUOICHIEU DB 'CHAO BUOI CHIEU$'
    BUOITOI DB 'CHAO BUOI TOI$'
    XUONGD DB 13,10,'$'
    KYTU DB ?

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        BATDAU:              ;NHAN 'BATDAU'
        
        MOV AH, 9            ;IN DONG 1
        LEA DX, DONG1
        INT 21H
        
        MOV AH, 1            ;NHAP KY TU 
        INT 21H
        MOV KYTU, AL
        
        MOV AH, 9            ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        CMP KYTU, 'S'        ;SO SANH KY TU NHAP TU BAN PHIM VOI KY TU 'S'
                             ;(CHUYEN TU MA ASCII SANG HE 16 DE SO SANH)
                             ;CMP (COMPARE - SO SANH)
                             
        JE SANG              ;NEU GIA TRI HE 16 CUA KY TU BANG GIA TRI
                             ;HE 16 CUA KY TU 'S', NHAY QUA 'SANG'
                             ;JE (JUMP IF EQUAL - NHAY NEU BANG)
        CMP KYTU, 's'
        JE SANG              
        
        CMP KYTU, 'C'        ;NT
        JE CHIEU
        CMP KYTU, 'c'
        JE CHIEU
        
        CMP KYTU, 'T'        ;NT
        JE TOI
        CMP KYTU, 't'
        JE TOI
        
        JMP BATDAU           ;NEU KHONG CO DIEU KIEN NAO THOA MAN,
                             ;NHAY QUA NHAN 'BATDAU'
        
        SANG:                ;NHAN 'SANG'
        
        MOV AH, 9            ;IN DONG CHAO BUOI SANG
        LEA DX, BUOISANG
        INT 21H
        JMP KETTHUC          ;NHAY QUA NHAN 'KETTHUC'
        
        CHIEU:               ;NHAN 'CHIEU'
        
        MOV AH, 9            ;IN DONG CHAO BUOI CHIEU
        LEA DX, BUOICHIEU
        INT 21H
        JMP KETTHUC
        
        TOI:                 ;NHAN 'TOI'
        
        MOV AH, 9            ;IN DONG CHAO BUOI TOI
        LEA DX, BUOITOI
        INT 21H
        JMP KETTHUC
        
        KETTHUC:             ;NHAN 'KETTHUC'
        
        MOV AH, 04CH         ;KET THUC CHUONG TRINH
        INT 21H
          
    MAIN ENDP
END MAIN
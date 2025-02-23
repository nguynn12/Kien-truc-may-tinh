.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'NHAP MOT KY TU (HOAC ESC): $'
    LACHU DB 'KY TU DA NHAP LA CHU$'
    LASO DB 'KY TU DA NHAP LA SO$'
    KHACCS DB 'KY TU DA NHAP KHAC CHU/SO$'
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
        
        MOV AH, 9           ;XUONG DONG 
        LEA DX, XUONGD
        INT 21H
        
        CALL KIEMTRA        ;GOI THU TUC 'KIEMTRA'
        
        MOV AH, 9           ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        LEA DX, XUONGD      ;XUONG DONG
        INT 21H
        
        LOOP BATDAU         ;LAP LAI NHAN 'BATDAU'
        
        KETTHUC:            ;NHAN 'KETTHUC'
        
        MOV AH, 04CH        ;KET THUC CHUONG TRINH
        INT 21H    
        
    MAIN ENDP
    
    KIEMTRA PROC            ;THU TUC 'KIEMTRA'
        
        CMP KYTU, 01BH      ;SO SANH KY TU NHAP VAO (CHUYEN THANH HE 16) VOI
                            ;01BH (KY TU ENTER)
                            
        JE KETTHUC          ;NEU BANG, NHAY DEN NHAN 'KETTHUC'
        
        CMP KYTU, '0'       ;NT
        JL KHAC
        
        CMP KYTU, '9'       ;NT
        JLE SO
        
        CMP KYTU, 'A'       ;NT
        JL KHAC
        
        CMP KYTU, 'Z'       ;NT
        JLE CHU
        
        CMP KYTU, 'a'       ;NT
        JL KHAC 
        
        CMP KYTU, 'z'       ;NT
        JLE CHU
          
        CHU:                ;NHAN 'CHU'
        
        MOV AH, 9           ;IN DONG 'LACHU'
        LEA DX, LACHU
        INT 21H
        RET                 ;RETURN, QUAY LAI CHO GOI THU TUC (CALL)
                            ;O DAY LA CALL KIEMTRA 
        
        SO:                 ;NT
        
        MOV AH, 9
        LEA DX, LASO
        INT 21H
        RET
        
        KHAC:               ;NT
        
        MOV AH, 9
        LEA DX, KHACCS
        INT 21H
        RET
        
    KIEMTRA ENDP
    
END MAIN
.MODEL SMALL
.STACK 100H
.DATA
    
    DONG1 DB 'NHAP MOT KY TU: $'
    LACHU DB 'KY TU DA NHAP LA CHU$'
    LASO DB 'KY TU DA NHAP LA SO$'
    KSOCHU DB 'KY TU DA NHAP KHAC CHU/SO$'
    XUONGD DB 13,10,'$'
    KYTU DB ?

.CODE

    MAIN PROC
        
        BATDAU:
        
        MOV AX, @DATA       
        MOV DS, AX
        
        MOV AH, 9           ;IN DONG 1
        LEA DX, DONG1
        INT 21H
        
        MOV AH, 1           ;NHAP KY TU
        INT 21H
        MOV KYTU, AL
        
        MOV AH, 9           ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        
        CMP KYTU, 01BH      ;SO SANH KY TU VOI KY TU 'ESC'
                            ;BANG CACH DOI SANG HE 16
                            
        JE KETTHUC          ;NEU KY TU BANG GIA TRI HE 16 CUA
                            ;KY TU 'ESC' , NHAY DEN NHAN 'KETTHUC'
        
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
        JL CHU
        
       
        KHAC:               ;NHAN 'KHAC'
        
        MOV AH, 9           ;HIEN THI DONG KSOCHU
        LEA DX, KSOCHU
        INT 21H
        JMP LAPLAI          ;NHAY DEN NHAN 'BATDAU' (LAP LAI)

        SO:                 ;NT
        
        MOV AH, 9
        LEA DX, LASO
        INT 21H
        JMP LAPLAI
                            
        CHU:                ;NT
        
        MOV AH, 9
        LEA DX, LACHU
        INT 21H
        JMP LAPLAI
        
        LAPLAI:
        
        MOV AH, 9           ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        LEA DX, XUONGD      ;XUONG DONG
        INT 21H
        
        LOOP BATDAU         ;LAP LAI NHAN 'BAT DAU', NEU
                            ;NGUOI DUNG KHONG NHAP KY TU
                            ;'ESC'
                            
        
        KETTHUC:            ;NHAN 'KETTHUC'
       
        MOV AH, 04CH        ;KET THUC CHUONG TRINH
        INT 21H
        
    MAIN ENDP
END MAIN
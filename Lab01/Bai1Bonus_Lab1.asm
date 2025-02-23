.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'THE SUM OF $'
    DONG2 DB ' AND $'
    DONG3 DB ' IS $'
    DONG4 DB 'THE SUM OF 2 DIGITS MUST BE LESS THAN 10!$'
    KYTU1 DB ?
    KYTU2 DB ?
    XUONGD DB 13,10,'$'

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 2          ;XUAT KY TU '?'
        MOV DL, '?'
        INT 21H
        
        MOV AH, 1          ;NHAP KY TU THU I
        INT 21H
        MOV KYTU1, AL
        
        INT 21H            ;NHAP KY TU THU II
        MOV KYTU2, AL
        
        SUB KYTU1, 30H     ;CHUYEN 2 KY TU NAY (ASCII)
        SUB KYTU2, 30H     ;SANG SO 
        
        MOV BH, KYTU1
        MOV CH, KYTU2
        
        ADD BH, CH         ;CONG 2 SO
        CMP BH, 0AH        ;SO SANH VOI 10 (0AH)
        JL DUNGDK          ;NEU BH < 10, CHAY VAO DUNGDK
        JGE THOAT          ;NEU BH >= 10, CHAY VAO THOAT
        
        DUNGDK:            
        
        MOV AH, 9          ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        LEA DX, DONG1      ;IN DONG 1
        INT 21H
        
        MOV AH, 2          ;HIEN THU KY TU THU I
        ADD KYTU1, 30H     ;CHUYEN KY TU TU SO SANG ASCII
        MOV DL, KYTU1
        INT 21H
        
        MOV AH, 9          ;IN DONG 2
        LEA DX, DONG2
        INT 21H
        
        MOV AH, 2          ;HIEN THI KY TU THU II
        ADD KYTU2, 30H     ;CHUYEN KY TU TU SO SANG ASCII
        MOV DL, KYTU2
        INT 21H 
        
        MOV AH, 9          ;IN DONG 3
        LEA DX, DONG3
        INT 21H
        
        ADD BH, 30H        ;CHUYEN TONG 2 SO THANH ASCII
        MOV AH, 2          ;HIEN THI TONG 2 SO
        MOV DL, BH
        INT 21H
       
        MOV AH, 04CH       ;KET THUC CHUONG TRINH
        INT 21H
        
        THOAT:
        
        MOV AH, 9          ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        LEA DX, DONG4      ;IN DONG 4
        INT 21H
        
        MOV AH, 04CH       ;THOAT CHUONG TRINH
        INT 21H
        
    MAIN ENDP
END MAIN
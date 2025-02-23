.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'NHAP SO THU NHAT: $'
    DONG2 DB 'NHAP SO THU HAI: $'
    XUONGD DB 13, 10, '$'
    
    LONHON DB 'I LON HON II$'
    BEHON DB 'I BE HON II$'
    BANG DB 'I BANG II$'

.CODE

    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9       ;IN DONG 1
        LEA DX, DONG1
        INT 21H
        
        MOV AH, 1       ;NHAP KY TU THU 1
        INT 21H
        MOV BL, AL      ;KHI NHAP, KY TU LUU VAO THANH GHI AL
                        ;VI VAY, PHAI LUU VAO THANH GHI BL (TAM)
                        
        MOV AH, 9       ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        MOV AH, 9       ;IN DONG 2
        LEA DX, DONG2
        INT 21H
        
        MOV AH, 1
        INT 21H
        MOV CL, AL      ;KHI NHAP, KY TU LUU VAO THANH GHI AL
                        ;VI VAY, KY TU THU II LUU VAO CL
                        
        MOV AH, 9
        LEA DX, XUONGD
        INT 21H
                        
        CMP BL, CL
        JG LON
        
        JL BE
        
        JE BANGNHAU
        
        
        LON:
        
        MOV AH, 9
        LEA DX, LONHON
        INT 21H
        
        JMP KETTHUC
        
        BE:
        
        MOV AH, 9
        LEA DX, BEHON
        INT 21H
        
        JMP KETTHUC
        
        BANGNHAU:
        
        MOV AH, 9
        LEA DX, BANG
        INT 21H
        
        KETTHUC:
        
        MOV AH, 04CH
        INT 21H                    
        
    MAIN ENDP
END MAIN
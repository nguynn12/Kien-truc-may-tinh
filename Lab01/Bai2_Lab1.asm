.MODEL SMALL
.STACK 100H
.DATA
    
    dong1 db 'Hay nhap mot ky tu: $'
    dong2 db 'Ky tu da nhap: $'
    kyTu db ?
    xuongd db 13,10,'$'
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9
        LEA DX, dong1  ;In dong 1
        INT 21H
        
        MOV AH, 1      ;Nhap 1 ky tu tu ban phim
        INT 21H
        MOV kyTu, AL
        
        MOV AH, 9      ;Xuong dong
        LEA DX, xuongd
        INT 21H
        
        LEA DX, dong2  ;In dong 2
        INT 21H
        
        MOV DL, kyTu
        MOV AH, 2      ;Hien thi 1 ky tu ra man hinh
        INT 21H
        
        MOV AH, 04CH
        INT 21H
        
    MAIN ENDP
END MAIN

;Hay nhap mot ky tu: 
;Ky tu da nhap: 
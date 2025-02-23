.MODEL SMALL
.STACK 100H
.DATA

    dong1 db 'Hay nhap mot ky tu: $'
    dong2 db 'Ky tu dung truoc: $'
    dong3 db 'Ky tu dung sau: $'
    kyTu db ?
    xuongd db 13,10,'$'

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9         ;In dong 1
        LEA DX, dong1
        INT 21H
        
        MOV AH, 1         ;Nhap 1 ky tu tu ban phim
        INT 21H
        MOV kyTu, AL      ;Gia su ky tu la 0
        
        MOV AH, 9         ;Xuong dong
        LEA DX, xuongd
        INT 21H
        
        LEA DX, dong2     ;In dong 2
        INT 21H
        
        DEC kyTu          ;Giam 1 bit, -1
        MOV DL, kyTu
        MOV AH, 2         ;Hien thi kyTu hien tai (-1)
        INT 21H
        
        MOV AH, 9         ;Xuong dong
        LEA DX, xuongd
        INT 21H
        
        LEA DX, dong3     ;In dong 3
        INT 21H 
        
        INC kyTu          ;Tang 1 bit, 0
        INC kyTu          ;Tang 1 bit, 1
        MOV DL, kyTu
        MOV AH, 2         ;Hien thi kyTu hien tai (1)
        INT 21H
        
        MOV AH, 04CH
        INT 21H
        
    MAIN ENDP
END MAIN

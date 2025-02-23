.MODEL SMALL
.STACK 100H
.DATA     
    xuongd db 13,10,'$'
    dong1 db 'Hay nhap mot ky tu: $'
    dong2 db 'Ky tu dung truoc: $'
    dong3 db '. da nhap: $'
    dong4 db ', dung sau: $'
    kytu db ?    
        
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9
        LEA DX, dong1
        INT 21H
        
        MOV AH, 1
        INT 21H
        MOV kytu, AL
             
        MOV AH, 9            
        LEA DX, xuongd
        INT 21H
        
        LEA DX, dong2
        INT 21H
        
        DEC kytu
        MOV DL, kytu
        MOV AH, 2
        INT 21H
        
        MOV AH, 9
        LEA DX, dong3
        INT 21H
        
        INC kytu
        MOV DL, kytu
        MOV AH, 2
        INT 21H
        
        MOV AH, 9
        LEA DX, dong4
        INT 21H
        
        INC kytu
        MOV DL, kytu
        MOV AH, 2
        INT 21H
        
        MOV AH, 04CH
        INT 21H
           
    MAIN ENDP
END MAIN
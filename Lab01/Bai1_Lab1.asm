.MODEL SMALL
.STACK 100H
.DATA
    dong1 db 'Hello, world !$'
    dong2 db 'Hello, solar system !$'
    dong3 db 'Hello, universe !$'
    xuongd db 13,10,'$'
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9
        LEA DX, dong1
        INT 21H
        
        LEA DX, xuongd
        INT 21H
        
        LEA DX, dong2
        INT 21H
        
        LEA DX, xuongd
        INT 21H
        
        LEA DX, dong3
        INT 21H
        
        MOV AH, 04CH
        INT 21H
        
    MAIN ENDP
END MAIN

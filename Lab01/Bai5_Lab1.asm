.MODEL SMALL
.STACK 100H
.DATA

    dong1 DB 'Nhap ky tu thu nhat: $'
    dong2 DB 'Nhap ky tu thu hai: $'
    dong3 DB 'Ky tu tong: $'
    ;kyTu1 DB ?
    ;kyTu2 DB ?
    xuongd DB 13,10,'$'
    

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9       
        LEA DX, dong1
        INT 21H
        
        MOV AH, 1       
        INT 21H
        ;MOV kyTu1, AL   
        ;MOV BL, kyTu1   
        MOV BL, AL
        
        MOV AH, 9       
        LEA DX, xuongd
        INT 21H
        
        LEA DX, dong2  
        INT 21H
        
        MOV AH, 1       
        INT 21H
        ;MOV kyTu2, AL   
        ;MOV CL, kyTu2   
        MOV CL, AL      
        
        MOV AH, 9       
        LEA DX, xuongd
        INT 21H
        
        LEA DX, dong3   
        INT 21H
               
        ADD BL, CL      
        MOV DL, BL      
        MOV AH, 2       
        INT 21H
        
        MOV AH, 04CH
        INT 21H
               
        
    MAIN ENDP
END MAIN



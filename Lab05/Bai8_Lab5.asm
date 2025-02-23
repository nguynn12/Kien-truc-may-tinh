.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'NGAY THANG NAM CUA HE THONG: $'
    GIO DB ?
    PHUT DB ?
    GIAY DB ?
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX    
        
        MOV AH, 9
        LEA DX, DONG1
        INT 21H
        
        MOV AH, 2CH
        INT 21H
        
        MOV GIO, CH
        
        MOV PHUT, CL
        
        MOV GIAY, DH
        
        XOR AX, AX
        XOR BX, BX
        XOR CX, CX
        
        MOV SI, 10
        
        MOV AL, GIO
        
        LAPGIO:
        
            XOR DX, DX
            
            DIV SI
        
            PUSH DX
            
            INC CX
            
            CMP AL, 0
            
            JNE LAPGIO
            
        XUAT:
        
            POP DX
            
            ADD DL, 030H
            
            MOV AH, 2
            INT 21H
            
            LOOP XUAT
            
        MOV AH, 2
        MOV DL, ':'
        INT 21H
            
        XOR AX, AX
        XOR BX, BX
        XOR CX, CX
        
        MOV SI, 10
        
        MOV AL, PHUT
        
        LAPPHUT:
        
            XOR DX, DX
            
            DIV SI    
        
            PUSH DX
            
            INC CX
            
            CMP AL, 0
            JNE LAPPHUT
            
        XUAT2:
        
            POP DX
            
            ADD DL, 030H
            
            MOV AH, 2
            INT 21H
            
            LOOP XUAT2
            
        MOV AH, 2
        MOV DL, ':'
        INT 21H    
            
        XOR AX, AX
        XOR BX, BX
        XOR CX, CX
        
        MOV SI, 10
        
        MOV AL, GIAY
        
        LAPGIAY:
        
            XOR DX, DX
            
            DIV SI    
        
            PUSH DX
            
            INC CX
            
            CMP AL, 0
            JNE LAPGIAY
            
        XUAT3:
        
            POP DX
            
            ADD DL, 030H
            
            MOV AH, 2
            INT 21H
            
            LOOP XUAT3    
            
        MOV AH, 04CH
        INT 21H
        
    MAIN ENDP
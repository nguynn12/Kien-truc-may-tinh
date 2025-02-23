.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'NGAY THANG NAM CUA HE THONG: $'
    NGAY DB ?
    THANG DB ?
    NAM DW ?
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX    
        
        MOV AH, 9
        LEA DX, DONG1
        INT 21H
        
        MOV AH, 2AH
        INT 21H
        
        MOV NGAY, DL
        
        MOV THANG, DH
        
        MOV NAM, CX
        
        XOR AX, AX
        XOR BX, BX
        XOR CX, CX
        
        MOV SI, 10
        
        MOV AL, NGAY
        
        LAPNGAY:
        
            XOR DX, DX
            
            DIV SI
        
            PUSH DX
            
            INC CX
            
            CMP AL, 0
            
            JNE LAPNGAY
            
        XUAT:
        
            POP DX
            
            ADD DL, 030H
            
            MOV AH, 2
            INT 21H
            
            LOOP XUAT
            
        MOV AH, 2
        MOV DL, '/'
        INT 21H
            
        XOR AX, AX
        XOR BX, BX
        XOR CX, CX
        
        MOV SI, 10
        
        MOV AL, THANG
        
        LAPTHANG:
        
            XOR DX, DX
            
            DIV SI    
        
            PUSH DX
            
            INC CX
            
            CMP AL, 0
            JNE LAPTHANG
            
        XUAT1:
        
            POP DX
            
            ADD DL, 030H
            
            MOV AH, 2
            INT 21H
            
            LOOP XUAT1
            
        XOR AX, AX
        XOR BX, BX
        XOR CX, CX
        
        MOV SI, 10
        
        MOV AX, NAM
        
        LAPNAM:
        
            XOR DX, DX
            
            DIV SI    
        
            PUSH DX
            
            INC CX
            
            CMP AL, 0
            JNE LAPNAM
            
        XUAT2:
        
            POP DX
            
            ADD DL, 030H
            
            MOV AH, 2
            INT 21H
            
            LOOP XUAT2    
            
        MOV AH, 04CH
        INT 21H
        
    MAIN ENDP
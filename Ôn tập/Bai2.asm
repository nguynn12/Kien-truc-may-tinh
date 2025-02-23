.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'HAY NHAP MOT CHU HOA THU 1 (A-Z): $'
    DONG2 DB 'HAY NHAP MOT CHU HOA THU 2 (A-Z): $'
    
    TRUOC DB 'KET QUA: KY TU 1 TRUOC KY TU 2$'
    SAU DB 'KET QUA: KY TU 1 SAU KY TU 2$'
    GIONG DB 'KET QUA: KY TU 1 GIONG KY TU 2$'
    
    XUONGD DB 13, 10, '$'
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        NHAP1:
        
            MOV AH, 9
            LEA DX, DONG1
            INT 21H
        
            MOV AH, 1
            INT 21H
            
            MOV BL, AL
            
            MOV AH, 9    
            LEA DX, XUONGD
            INT 21H
                
            CMP BL, 'A'
            JB NHAP1
            
            CMP BL, 'Z'
            JA NHAP1
        
        NHAP2:
            
            MOV AH, 9
            LEA DX, DONG2
            INT 21H
        
            MOV AH, 1
            INT 21H
            
            MOV CL, AL
            
            MOV AH, 9    
            LEA DX, XUONGD
            INT 21H
            
            CMP CL, 'A'
            JB NHAP2
            
            CMP CL, 'Z'
            JA NHAP2
                  
        CMP BL, CL
        JB DUNGTRUOC
        
        JA DUNGSAU
        
        JE GIONGNHAU
            
        DUNGTRUOC:
            
            LEA DX, TRUOC
            INT 21H
            
            JMP KETTHUC
            
        DUNGSAU:
        
            LEA DX, SAU
            INT 21H
            
            JMP KETTHUC
            
        GIONGNHAU:
        
            LEA DX, GIONG
            INT 21H
            
        KETTHUC:
        
            MOV AH, 04CH
            INT 21H
                   
    MAIN ENDP
END MAIN
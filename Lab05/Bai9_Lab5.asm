.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'NHAP SO THAP LUC PHAN (TOI DA 4 KY SO): $'
    DONG2 DB 'SO THAP LUC PHAN DA NHAP: $'
    XUONGD DB 13, 10, '$'
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        XOR BX, BX       
        
        MOV CL, 0        
        
        MOV AH, 9        
        LEA DX, DONG1
        INT 21H
        
        NHAP:            
        
            MOV AH, 1    
            INT 21H
            
            CMP AL, 0DH  
                         
            JE XUAT
            
            CMP AL, 030H 
                         
            JB NHAP
            
            CMP AL, 039H 
                         
                         
            JBE TIEPTUC  
            
            CMP AL, 046H 
                         
            JA NHAP
            
            CMP AL, 041H 
                         
                         
            JAE TIEPTUC  
            
            JMP NHAP     
                         
            
            TIEPTUC:     
            
            INC CX       
            
            CMP CX, 4    
            JE XUAT
            
            CMP AL, 039H   
                           
            JA CHU
            
            AND AL, 0FH    
                           
                           
            JMP DICH       
            
            CHU:           
            
            SUB AL, 37H    
            
            DICH:          
            
            SHL BX, 4      
                           
                           
            OR BL, AL      
                           
            
            JMP NHAP       
                           
            
       XUAT:
       
            MOV AH, 9      
            LEA DX, XUONGD
            INT 21H
            
            LEA DX, DONG2  
            INT 21H
            
                               
            MOV DX, 16     
            MOV AL, 4      
            MUL CL         
            
            SUB DX, AX     
            
            MOV AX, DX     
            
            DICHTRAI:      
            
                CMP AX, 0  
                           
                           
                           
                JE DICHUYEN
                
                           
                           
                
                SHL BX, 1  
                
                DEC AX     
                
                CMP AX, 0          
                                   
                                   
                JNE DICHTRAI       
                                   
                
                DICHUYEN:          
                
                    MOV DL, BH                                          
                                   
                    SHR DL, 4      

                    CMP DL, 9      
            
                    JA XUATCHU     
                
                    ADD DL, 030H          
                                   
                    MOV AH, 2      
                    INT 21H
                
                    JMP DICH2      
                
                XUATCHU:
                
                    ADD DL, 037H
                
                    MOV AH, 2
                    INT 21H
           
                DICH2:              
                
                    SHL BX, 4              
                
                      

            MOV AH, 04CH          
            INT 21H
                    
    MAIN ENDP
END MAIN
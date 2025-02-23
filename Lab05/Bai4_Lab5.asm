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
        
        XOR BX, BX          ;XOA GIA TRI THANH GHI BX
        
        MOV AH, 9           ;IN DONG 1
        LEA DX, DONG1
        INT 21H
        
        NHAP:               ;NHAN 'NHAP'
        
            MOV AH, 1       ;NHAP KY TU       
            INT 21H
            
            CMP AL, 0DH     ;NEU KY TU NHAP LA ENTER, THI
                            ;NHAY DEN NHAN 'XUAT'
            JE XUAT
            
            CMP AL, 030H    ;NEU KY TU NHAP BE HON '0', THI
                            ;NHAP LAI
            JB NHAP
            
            CMP AL, 039H    ;NEU KY TU NHAP BE HON '9' (CO
                            ;NGHIA LA DA LON HON '0'), THI
                                      
            JBE TIEPTUC     ;NHAY DEN NHAN 'TIEPTUC'
            
            CMP AL, 046H    ;NEU KY TU NHAP LON HON 'F', THI
                            ;NHAP LAI
            JA NHAP
            
            CMP AL, 041H    ;NEU KY TU NHAP BE HON 'A', (CO
                            ;NGHIA LA DA BE HON 'F'), THI
                            
            JAE TIEPTUC     ;NHAY DEN NHAN 'TIEPTUC'
            
            JMP NHAP        ;CON NEU KHONG (TRONG KHOANG TU
                            ;'9' TOI 'A'), THI NHAP LAI
            
            TIEPTUC:        ;NHAN 'TIEPTUC'
            
            CMP AL, 039H    ;NEU KY TU NHAP LA CHU, NHAY DEN
                            ;NHAN 'CHU'
            JA CHU
            
            AND AL, 0FH     ;CON NEU KHONG (SO), LAY GIA TRI
                            ;4 BIT CUOI CUA THANH GHI AL
                            
            JMP DICH        ;NHAY DEN NHAN 'DICH'
            
            CHU:            ;NHAN 'CHU'
            
            SUB AL, 37H     ;DOI KY TU THANH GIA TRI
            
            DICH:           ;NHAN DICH
            
            SHL BX, 4       ;DICH TRAI BX 4 LAN (VI KY TU O
                            ;HE THAP LUC PHAN LA 4 BIT)
                            
            OR BL, AL       ;LUU 4 BIT CUOI CUA THANH GHI AL
                            ;VAO BL
            
            JMP NHAP        ;CON KHONG THI TIEP TUC NHAP CHO
                            ;DEN KHI CX=4
            
       XUAT:
       
            MOV AH, 9       ;XUONG DONG
            LEA DX, XUONGD
            INT 21H
            
            LEA DX, DONG2   ;IN DONG 2
            INT 21H
            
            MOV CL, 4
            
                DICHUYEN:           ;NHAN 'DICHUYEN'
                
                    MOV DL, BH      ;VI GHI DICH TRAI THANH GHI BX THI GIA TRI
                                    ;DAU NHAP SE DUOC LUU O THANH GHI BH.
                                    
                                    ;VI KHI XUAT SU DUNG HAM NGAT 2, NEN TA PHAI
                                    ;DI CHUYEN GIA TRI THANH GHI BH VAO DL
                                    
                                    
                    SHR DL, 4       ;KHI DI CHUYEN BH VAO DL, THI 4 BIT DAU TIEN
                                    ;CUA THANH GHI BH SE DUOC LUU VAO 4 BIT DAU TIEN
                                    
                                    ;CUA THANH GHI DL.
                                    
                                    ;VAY TA PHAI DICH TRAI THANH GHI DL QUA 4 LAN 
                                    ;DE CAC GIA TRI DO LUU O 4 BIT CUOI CUNG, 
                                    
                                    ;THI LUC NAY TA MOI TRA VE KY TU ASCII CUA 
                                    ;GIA TRI DO DE HIEN THI
                                    
                
                    CMP DL, 9       ;NEU NHU 4 BIT CUOI CUNG LA CHU, THI NHAY DEN
                                    ;NHAN 'XUATCHU'
                                    
                                    
                    JA XUATCHU      ;CON KHONG THI VAN XUAT SO RA NHU BINH THUONG
                    
                
                    ADD DL, 030H    ;VI GIA TRI TRONG DL LA DO TA CHUYEN TU KY TU
                                    ;ASCII SANG GIA TRI, CHO NEN CAN PHAI TRA LAI
                                    
                                    ;KY TU ASCII TUONG UNG CUA GIA TRI DO
                
                    MOV AH, 2       ;HIEN THI KY TU
                    INT 21H
                
                    JMP DICH2       ;SAU KHI HIEN THI XONG, NHAY DEN NHAN 'DICH2'
                
                XUATCHU:
                
                    ADD DL, 037H
                
                    MOV AH, 2
                    INT 21H
            
            ;LY GIAI VI SAO LAI CO CAC BUOC TU DONG 142 TOI DONG 152
            
            
            ;SAU KHI XUAT GIA TRI TU THANH GHI DL XONG (CHI LAY 4 BIT DAU TIEN CUA THANH
            ;GHI BH, THI TA CAN PHAI DICH TRAI THANH GHI BH DE LAY 4 BIT CUOI CUNG SAU DO
            
            ;DI CHUYEN TIEP VAO THANH GHI DL VA THUC HIEN LAI CAC BUOC TU NHAN 'DICHUYEN'
                
            
                DICH2:              
                
                    SHL BX, 4       ;DICH TRAI THANH GHI BX DE LAY CAC BIT CON LAI TRONG
                                    ;THANH GHI DE HIEN THI RA MAN HINH
                
                    DEC CL          ;MOI LAN HIEN THI, GIAM GIA TRI THANH GHI CL DI 1 LAN 
                                    ;(LUU SO LAN NHAP - DA KHOI TAO TU LUC DAU)
                
                    CMP CL, 0       ;NEU CL KHAC 0, TA VAN HIEN THI CAC KY TU CHO DEN KHI
                                    ;CL=0, THI KET THUC CHUONG TRINH
                    JNE DICHUYEN                   

            MOV AH, 04CH            ;KET THUC CHUONG TRINH
            INT 21H
                    
    MAIN ENDP
END MAIN
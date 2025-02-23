.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'NHAP SO THAP PHAN: $'
    DONG2 DB 'SO THAP PHAN VUA NHAP: $'
    XUONGD DB 13, 10, '$'
    KYTU DB ?
    
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9       ;IN DONG 1
        LEA DX, DONG1
        INT 21H
        
        CALL NHAP       ;GOI THU TUC NHAP
        
        MOV AH, 9       ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        LEA DX, DONG2   ;IN DONG 2
        INT 21H
        
        CALL XUAT       ;GOI THU TUC XUAT
        
        MOV AH, 04CH    ;KET THUC CHUONG TRINH
        INT 21H
            
    MAIN ENDP
    
    ;NHAP SO THAP PHAN
    
    ;DAU TIEN, NHAP DAU (+): SO DUONG, (-): SO AM
    
    
    ;DUOI DAY LA CACH DE LUU GIA TRI SO VAO THANH GHI BX
    
    
    ;GIA SU, TA NHAP SO 123. KHI TACH CAC CHU SO THEO HANG,
    ;TA CO 123 = 100 + 20 + 3 = 120 + 3
    
    ;VAY BAN DAU, DAT 'TONG' = 0, KHI NHAP '1'(KY TU ASCII),
    ;PHAI DOI '1' THANH GIA TRI SO (CO NGHIA LA SO 1), ROI THUC HIEN
    
    ;PHEP TINH LAY 10 * 'TONG' + 1 = 10 * 0 + 1 = 1. SAU DO, GAN
    ;KET QUA VUA TINH VAO BIEN 'TONG'. TIEP TUC, NHAP '2', THI
    
    ;CUNG LAM TUONG TU VOI '1' (DOI SANG GIA TRI SO), ROI THUC HIEN
    ;PHEP TINH NHU TREN ('TONG' HIEN TAI CO GIA TRI BANG 1'). CO NGHIA
    
    ;LA 10 * 'TONG' + 2 = 10 * 1 + 2 = 10 + 2 = 12. TIEP TUC KHI NHAP
    ;'3', THI CUNG THUC HIEN CAC BUOC NHU TREN (CHUYEN VE GIA TRI).
    
    ;LUC NAY, 'TONG' = 12, 10 * 'TONG' + 3 = 10 * 12 + 3 = 120 + 3 = 123
    
    ;VAY, TA SE GAN 'TONG' = 10 * 'TONG' + <KY TU NHAP TU BAN PHIM>, ROI
    ;LUU GIA TRI NAY VAO THANH GHI BX
    
    ;(KY TU NHAP TU BAN PHIM BAN DAU SE LA DAU TRU (-) HOAC DAU CONG (+), 
    ;SAU DO KY TU NAY CHI CO PHAM VI TU '0' DEN '9' (VI NHAP SO THAP PHAN) 
    
    NHAP PROC
    
    ;==================== NHAP DAU ====================;
    
        
        XOR BX, BX          ;XOA THANH GHI BX (BX=0), DE LUU KET
                            ;QUA NHAP
        
        XOR SI, SI          ;XOA THANH GHI SI (SI=0), DE KIEM TRA
                            ;SO DUONG HAY SO AM
        
        MOV AH, 1           ;NHAP KY TU DAU TIEN
        INT 21H
        
        CMP AL, '-'         ;SO SANH GIA TRI HE 16 CUA KY TU DA NHAP
                            ;VOI HE 16 CUA KY TU '-'
                        
        JNE SODUONG         ;NEU KHONG NHAP '-', NHAY DEN NHAN 'SODUONG'
        
        MOV SI, 1           ;NEU NHAP '-' (NHAP SO AM), THI CAP NHAT GIA TRI
                            ;THANH GHI SI = 1 (SO AM), VI BAN DAU DA XOA
                        
                            ;GIA TRI THANH GHI SI (XOR SI, SI). MAC DINH BAN DAU
                            ;SO NHAP VAO SO DUONG 
        
        SODUONG:            ;NHAN 'SODUONG'
        
            CMP AL, '+'     ;NT
        
            JE TIEPTUC      ;NEU NGUOI DUNG NHAP DAU CONG (+), THI NHAY DEN
                            ;NHAN 'TIEPTUC'
                                 
                                 
    ;==================== NHAP SO ====================;
              
                                 
        TIEPTUC:
        
            LAP:
            
                MOV AH, 1
                INT 21H         ;NHAP KY TU TIEP THEO (KY TU ASCII CUA SO)
                
                CMP AL, 0DH
                JE KIEMTRADAU
            
                ;TINH TONG, LUU VAO THANH GHI BX       
            
                SUB AL, 030H    ;CHUYEN KY TU SANG GIA TRI SO (GIA SU NHAP '1', CO
                                ;GIA TRI HE 16 LA 31H, CHUYEN SANG GIA TRI SO
                            
                                ;TA TRU DI 30H, (31H - 30H = 1). LUC NAY DA CHUYEN
                                ;SANG GIA TRI SO
                                
                MOV KYTU, AL    
                                
                MOV AX, BX      ;GAN AX=0 (DAT BIEN 'TONG' = 0)
            
                MOV CX, 10      ;GAN CX=10 (DE THUC PHEP NHAN 10 VOI TONG)
            
                MUL CX          ;NHAN GIA TRI CX(10) VOI AL(TONG, SAU DO GAN KET QUA 
                                ;VAO AX (DAY LA BUOC THUC HIEN CUA LENH MUL)
                            
                                ;NHAN THANH GHI AL VOI TOAN TU (CX) SAU DO GAN VAO AX 
                            
                                ;CX * AL -> AX (10 * 0 -> AX => AX = 0)
                                
                MOV DL, KYTU

                ADD AX, DX      ;BX = BX + (GIA TRI KY TU SO)
                
                MOV BX, AX
            
                JMP LAP
                
            
    ;==================== KIEM TRA DAU ====================;
                    
                    
        KIEMTRADAU:
                
            CMP SI, 0       ;KIEM TRA SO NHAP VAO CO PHAI SO DUONG HAY KHONG,
            
            JE KETTHUCNHAP  ;NEU LA SO DUONG THI, NHAY DEN NHAN 'KETTHUCNHAP'
            
            NEG BX          ;CON NEU KHONG (LA SO AM), THI DAO DAU BX
            
            
            KETTHUCNHAP:    ;KET THUC VIEC NHAP, CHUYEN TOI VIEC XUAT
            
                RET         ;QUAY LAI SAU LENH CALL (CALL NHAP - O HAM MAIN)
                
    NHAP ENDP
    
    
    ;XUAT SO THAP PHAN
    
    ;BAN DAU, KIEM TRA XEM SO NHAP VAO LA SO DUONG HAY SO AM, CO NGHIA LA
    ;SO SANH BX (VI SO NHAP VAO HIEN TAI DUOC LUU VAO THANH GHI BX) VOI SO 0
    
    ;GIA SU BX HIEN TAI CO GIA TRI LA 123, VAY DE XUAT SO '1', TA THUC HIEN CAC
    ;BUOC SAU (SU DUNG STACK - NGAN XEP)
    
    ;LAY BX CHIA CHO 10 (123:10), THI PHAN DU LA 3 SE DUOC LUU VAO THANH GHI DX,
    ;PHAN THUONG LA 12 SE DUOC LUU VAO THANH AX. SAU DO THEM '3' VAO NGAN XEP
    
    ;TIEP TUC, TA CHIA 12 CHO 10, PHAN DU LUU VAO DX, THUONG LUU VAO AX. SAU DO,
    ;THEM '2' VAO NGAN XEP. LUC NAY NEU CHIA TIEP (1:10) THI PHAN THUONG BANG 0 (AX=0)
    
    ;LUC NAY NGAN XEP DANG LUU CAC GIA (TU TREN XUONG DUOI LA 1, 2, 3). VAY CHI CAN
    ;LAY CAC GIA TRI NAY RA KHOI NGAN XEP LA TA DA XUAT THANH CONG SO 123
    
    
    XUAT PROC 
        
        
    ;==================== KIEM TRA DAU ====================;
        
        CMP BX, 0           ;SO SANH BX VOI 0
        
        JG LASODUONG        ;NEU BX LON HON 0, NHAY DEN NHAN
                            ;'LASODUONG' 
        
        MOV AH, 2           ;NGUOC LAI, BX LA SO AM, THI HIEN THI DAU
                            ;TRU (-) TRUOC
        MOV DL, '-'
        INT 21H
        
        NEG BX              ;SAU DO TRA LAI GIA TRI DUONG CHO BX
        
        LASODUONG:
        
            MOV CX, 0       ;LUU SO PHEP CHIA THUC HIEN (MOI LAN CHIA, THEM
                            ;VAO NGAN XEP. VI DU SO 123 TA CHIA 3 LAN, THI
                            
                            ;THEM 3 LAN VAO NGAN XEP, LUC XUAT CHI CAN LAP 3 LAN)
        
            MOV SI, 10      ;GAN SI = 10 DE CHIA
            
            MOV AX, BX 
            
            
    ;==================== BO TUNG SO VAO NGAN XEP ====================;   
        
        
        LAPLAIBUOCCHIA:         ;NHAN 'LAPLAIBUOCCHIA'
        
            XOR DX, DX          ;DAU TIEN, XOA GIA TRI DX DE KHONG BI DE DU LIEU
    
            DIV SI              ;SAU DO LAY BX CHIA SI, ROI LUU PHAN DU VAO DX,
                                ;PHAN THUONG VAO AX (DO LENH DIV - DIVIDE: CHIA) 
            
            PUSH DX             ;MOI LAN CHIA, PHAN DU DUOC LUU VAO DX, TA THEM
                                ;GIA TRI DX VAO NGAN XEP
            
            INC CX              ;SAU MOI LAN CHIA, TANG GIA TRI THANH GHI CX LEN
                                ;DE DEM SO LAN DA CHIA
            
            CMP AX, 0           ;NEU KHONG CHIA DUOC NUA (VI MOI LAN CHIA, THUONG
                                ;LUU VAO AX, NEU AX=0 (CO NGHIA LA KHONG THE CHIA NUA)
                                
                                ;THI TA KET THUC VONG LAP))
                                
            JNE LAPLAIBUOCCHIA  ;CON NEU KHONG THI TIEP TUC CHO DEN KHI KHONG
                                ;CHIA DUOC NUA  
                                
            
    ;==================== XUAT TUNG SO TU NGAN XEP ====================;
        
        
        LAPXUAT:                ;NHAN 'LAPXUAT'
        
            POP DX              ;DAU TIEM, LAY TUNG GIA TRI DA LUU TRONG NGAN XEP
                                ;GAN VAO THANH GHI DX (GIA SU LUC NAY LA SO 123,
                                
                                ;TU TREN XUONG DUOI, GAN TUNG GIA TRI VAO DX)
            
            ADD DL, 030H        ;SAU KHI DA GAN CHO DX, LUC NAY LA GIA TRI DANG DUOC
                                ;LUU O DL (THI TA TRA LAI KY TU ASCII CHO TUNG KY TU)
            
            MOV AH, 2           ;HIEN THI KY TU
            INT 21H
            
            LOOP LAPXUAT        ;LAP LAI CHO DEN KHI CX = 0
        
        RET                     ;QUAY LAI SAU LENH CALL (O DAY LA CALL XUAT)    
        
    XUAT ENDP
    
END MAIN
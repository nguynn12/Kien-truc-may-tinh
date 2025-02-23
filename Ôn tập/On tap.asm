.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'XIN CHAO$'
    DONG2 DB 'HELLO$'
    DONG3 DB 'HAY NHAP 1 KY TU: $'
    DONG4 DB 'KY TU VUA NHAP: $'
    
    XUONGD DB 13,10,'$'
    
.CODE
    MAIN PROC ;PROCEDURE
        
        MOV AX, @DATA
        MOV DS, AX
        
        
        ;============= XUAT CHUOI =============;
        
        
        MOV AH, 9       ;IN DONG 1
        LEA DX, DONG1
        INT 21H
        
        LEA DX, XUONGD  ;XUONG DUONG
        INT 21H
        
        LEA DX, DONG2   ;IN DONG 2
        INT 21H                   
        
        
        ;============= NHAP KY TU =============;
        
        MOV AH, 1   ;NHAP KY TU, IN RA MAN HINH
        ;MOV AH, 8  ;NHAP KY TU, NHUNG KHONG IN RA MAN HINH
        
        INT 21H
        
        ;KHI NHAP KY TU TU BAN PHIM, GIA TRI HE 16 DUOC LUU VAO THANH GHI AL
        
        
        ;============= XUAT KY TU =============;
        
        MOV AH, 2
        MOV DL, AL
        INT 21H
        
        ;KHI XUAT KY TU NHAP TU BAN PHIM, PHAI LAY TU THANH GHI DL (MOV DL, AL)
        
        MOV AH, 04CH    ;KET THUC CHUONG TRINH
        INT 21H
        
        ;============= CAC LENH THONG DUNG =============;
        
        ;LENH CONG, GOM CO 2 LOAI
        
        ;1. CONG DAN DAN
        ;INCREASE
        INC AL ;AL + 1 -> AL
        
        ;2. CONG TRUC TIEP
        ;ADD (THANH GHI PHAI CUNG SO BIT)
        ADD BL, AL ;AL + BL -> BL
        
        
        
        ;LENH TRU, GOM CO 2 LOAI
        
        ;1. TRU DAN DAN
        ;DECREASE
        DEC AL ;AL - 1 -> AL
        
        ;2. TRU TRUC TIEP
        ;SUBSTRACT (THANH GHI PHAI CUNG SO BIT)
        SUB BL, AL; AL - BL -> BL
        
        
        
    
    MAIN ENDP ;END PROCEDURE
END MAIN
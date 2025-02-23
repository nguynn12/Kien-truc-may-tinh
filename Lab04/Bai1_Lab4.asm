.MODEL SMALL
.STACK 100H
.DATA

    DONG1 DB 'HAY NHAP CHUOI KY TU (KET THUC BANG ENTER): $'
    DONG2 DB 'CHUOI NGUOC: $'
    XUONGD DB 13, 10, '$'

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 9       ;IN DONG 1
        LEA DX, DONG1
        INT 21H
        
        MOV CX, 0       ;LUU SO LUONG KY TU DA NHAP
        
        NHAP:           ;NHAN 'NHAP'
        
        MOV AH, 1       ;NHAP KY TU     
        INT 21H
        
        CMP AL, 0DH     ;SO SANH GIA TRI HE 16 CUA KY TU VA
                        ;0DH (ENTER)
                        
        JE HIENTHI      ;NEU BANG, NHAY SANG NHAN 'HIENTHI'
        
        PUSH AX         ;THEM VAO NGAN XEP
        
        INC CX          ;MOI LAN NHAP KY TU, TANG GIA TRI
                        ;THANH GHI CX LEN 1
                        
        JMP NHAP        ;NHAP LAI CHO DEN KHI NGUOI DUNG NHAP
                        ;KY TU 'ENTER'
        
        HIENTHI:        ;NHAN 'HIENTHI'
        
        MOV AH, 9       ;XUONG DONG
        LEA DX, XUONGD
        INT 21H
        
        LEA DX, DONG2   ;IN DONG 2
        INT 21H
        
        XUAT:           ;NHAN 'XUAT'
        
        CMP SP, 100H    ;NEU SP DA DAT TOI DINH, NGAN XEP RONG
                        
        JE KETTHUC      ;KET THUC CHUONG TRINH
        
        POP AX          ;LAY GIA TRI RA KHOI NGAN XEP, LUU
                        ;VAO THANH GHI AX
        
        MOV DL, AL      ;GAN GIA TRI THAP CUA THANH GHI AX(AL)
                        ;CHO DL
        
        MOV AH, 2       ;HIEN THI KY TU
        INT 21H    
        
        DEC CX          ;GIAM GIA TRI THANH GHI CX DI 1
        
        CMP CX, 0       ;NEU GIA TRI THANH GHI CX = 0, NHAY
                        ;DEN NHAN 'KETTHUC'
        JE KETTHUC
        
        JMP XUAT        ;CON KHONG THI VAN TIEP TUC VONG LAP
        
        KETTHUC:
        
        MOV AH, 04CH    ;KET THUC CHUONG TRINH
        INT 21H
        
    MAIN ENDP
END MAIN
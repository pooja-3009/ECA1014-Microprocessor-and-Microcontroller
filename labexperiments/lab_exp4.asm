                                                      DATA SEGMENT
    SRC DB 11H, 22H, 33H, 44H, 55H
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA
    MOV DS, AX
    MOV ES, AX

    ; Forward block transfer
    LEA SI, SRC
    LEA DI, SRC+5
    MOV CX, 5
    CLD
    REP MOVSB

    ; Overlapping block transfer backward
    LEA SI, SRC+4
    LEA DI, SRC+5
    MOV CX, 5
    STD
    REP MOVSB

    CLD
    HLT

CODE ENDS
END START
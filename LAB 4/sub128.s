	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R0,=SRC1
	LDR R1,=SRC2
	LDR R4,=DST
	LDR R6,[R0]
	LDR R7,[R1]
	MOV R3, #3
	SUBS R5,R6,R7
	STR R5, [R4], #4
	ADD R0,#4
	ADD R1,#4
	
loop
	LDR R6,[R0]
	LDR R7,[R1]
	SBCS R5,R6,R7
	ADD R0,#4
	ADD R1,#4
	STR R5,[R4],#4
	SUB R3,#1
	TEQ R3,#0
	BNE loop

STOP B STOP
SRC1 DCD 0,2,3,4
SRC2 DCD 1,2,3,4
	AREA mydata,DATA,READWRITE
DST DCD 0,0,0,0
	END
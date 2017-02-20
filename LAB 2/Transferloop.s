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
	LDR R0,=SRC
	LDR R1,=DST
	MOV R2,#5
back LDR R3,[R0]
	STR R3,[R1]
	ADD R0, #4
	ADD R1, #4
	
	SUB R2,#1
	TEQ R2,#0
	BNE back
	
STOP B STOP


	AREA mydata,DATA,READWRITE
SRC DCD 0,0,0,0,0
DST DCD 0,0,0,0,0
	END
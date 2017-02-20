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
	LDR R1,=SRC
	
	ADD R0,#16
	MOV R2,#2
	
back LDR R3,[R0]
	LDR R4,[R1]
	STR R3,[R1]
	STR R4,[R0]
	
	ADD R1,#4
	SUB R2,#1
	SUB R0,#4
	
	TEQ R2,#0
	BNE back

STOP B STOP


	AREA mydata,DATA,READWRITE
SRC DCD 1,2,3,4,5

	END
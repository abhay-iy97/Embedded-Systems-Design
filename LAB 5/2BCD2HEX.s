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
	LDR R0,=bcd
	LDR R1,[R0]
	MOV R2,R1
	LSR R2,#4
	AND R1,#0x0F
	MOV R3,#0x0A
	MLA R2,R2,R3,R1
	LDR R6,=hex
	STR R2,[R6]
STOP B STOP
bcd DCD 0x78
	AREA mydata,DATA,READWRITE
hex DCD 0
	END
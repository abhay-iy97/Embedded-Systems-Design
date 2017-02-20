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
	LDR R5,=hex
	LDR R1,[R0]
	MOV R2,R1
	MOV R3,R1
	AND R2,#0x0F
	MOV R6,#0x0A
	MOV R9,#0x0A
	MOV R7,#7
	
loop LSR R3,R3,#4
	MOV R4,R3
	AND R4,#0x0F
	MLA R2,R4,R6,R2
	MUL R6,R6,R9
	SUB R7,#1
	TEQ R7,#0
	BNE loop

	STR R2,[R5]
STOP B STOP
bcd DCD 0x12345678
	AREA mydata,DATA,READWRITE
hex DCD 0
	END
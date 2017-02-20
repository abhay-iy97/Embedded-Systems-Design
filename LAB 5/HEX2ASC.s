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
	LDR R0,=hex
	LDR R1,=ASC
	LDR R2,[R0]
	MOV R3,R2
	MOV R4,#8
	
back	AND R3,#0x0F
	BL HEX_ASC
	LSR R2,#4
	MOV R3,R2
	SUB R4,#1
	TEQ R4,#0
	BNE back
STOP B STOP
HEX_ASC
up	CMP R3,#0x0A
	BLO down
	ADD R3,#0x37
	STR R3,[R1],#1
	BX LR

down	ADD R3,#0x30
	STR R3,[R1],#1
	BX LR
hex DCD 0x8A123456
	AREA mydata,DATA,READWRITE
ASC DCD 0
	END
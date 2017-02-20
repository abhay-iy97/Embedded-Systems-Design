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
	LDR R0,=ASC
	LDR R1,=hex
back	LDR R2,[R0],#4
	MOV R3,R2
	MOV R4,#8
	BL ASC_HEX
	SUB R4,#1
	TEQ R4,#0
	BNE back
STOP B STOP
ASC_HEX
up	CMP R3,#0x41
	BLO down
	SUB R3,#0x37
	STR R3,[R1],#4
	BX LR
down SUB R3,#0x30
	STR R3,[R1],#4
	BX LR
ASC DCD 0x8A123456
	AREA mydata,DATA,READWRITE
hex DCD 0
	END
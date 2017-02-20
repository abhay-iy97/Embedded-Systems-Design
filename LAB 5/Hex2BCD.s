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
	LDR R1,[R0]
	MOV R8,#0
	MOV R7,#32
back BL divide
	CMP R1,#0
	BNE back
	LSR R8,R7
	LDR R10,=bcd
	STR R8,[R10]
STOP B STOP

divide MOV R3,#0
up	CMP R1,#0x0A
	BLO down 
	SUB R1,#0x0A
	ADD R3,#1
	B up

down ORR R8,R1
	ROR R8,#4
	SUB R7,#4
	MOV R1,R3
	BX LR

hex DCD 0x4e
	AREA mydata,DATA,READWRITE
bcd DCD 0
	END
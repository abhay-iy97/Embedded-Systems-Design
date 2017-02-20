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
	LDR R0,=num1
	LDR R1,=num2
	LDR R2,=prod
	LDR R5,[R0]
	LDR R6,[R1]
	UMULL R3,R4,R5,R6
	STR R4,[R2],#4
	STR R3,[R2]
STOP B STOP

num1 DCD 0x00000002
num2 DCD 0x00000002
	
	AREA mydata,DATA,READWRITE
prod DCD 0,0
	END
	
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
	LDR R6,=sum
	LDR R10,[R0]
	LDR R11,[R1]
	MOV R9,#0
	MSR xPSR,R9
	MOV R3,#0
	MOV R4,#0
Back 
	ADDS R4,R10
	ADC R3,#0
	SUB R11,#1
	TEQ R11,#0
	BNE Back

	STR R4,[R6],#4
	STR R3,[R6]
STOP B STOP
num1 DCD 0x12345678,0x0
num2 DCD 0x00000002,0x0
	AREA mydata,DATA,READWRITE
sum DCD 0,0
END
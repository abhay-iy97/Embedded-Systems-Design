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
	MOV R8,#0
	MSR xPSR,R8
	MOV R7,#4
	
Back LDR R3,[R0],#4
	 LDR R4,[R1],#4
	 ADCS R5,R3,R4
	 STR R5,[R6],#4
	 SUB R7,#1
	 TEQ R7,#0
	 BNE Back
STOP B STOP
num1 DCD 0x00000001,0x0,0x0,0x0,0x0,0x0,0x0,0x0
num2 DCD 0x00000001,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	AREA mydata,DATA,READWRITE
sum DCD 0,0
END
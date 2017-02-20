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
	LDR R7,=SRC
	LDR R6,=DST
	MOV R1,#4
	
Back
	LDR R0,[R7],#4
	ADDS R4,R0
	ADC R3,#0
	SUB R1,#1
	TEQ R1,#0
	BNE Back
	STR R4,[R6],#4
	STR R3,[R6]
STOP B STOP
SRC DCD 1,2,3,4
	AREA mydata,DATA,READWRITE
DST DCD 0
END	
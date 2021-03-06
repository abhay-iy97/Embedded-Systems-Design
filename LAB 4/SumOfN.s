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
	LDR R0,=n
	LDR R1,[R0]
	LDR R2,=DST
	MLA R2,R1,R1,R1
	ASR R2,#1
	STR R2,[R1]
STOP B STOP
n DCD 0x00000005
	AREA mydata,DATA,READWRITE
DST DCD 0
	END
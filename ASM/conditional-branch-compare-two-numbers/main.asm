.386
.MODEL FLAT ; Flat memory model
.STACK 4096 ; 4096 bytes

; Exit function
ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD

; IO Library
INCLUDE ..\masm\src\io.inc

; Global variables
.DATA

    ; String prompts:
    strWelcome BYTE "Welcome!", 10, 0
    strClose BYTE "Bye!", 10, 0
    strNewLine BYTE 10, 0

    strInput BYTE "Enter a number: ", 0
    strOutput1 BYTE "You have entered the number: ", 0
    strOutput2 BYTE "The larger number is: ", 0
    strOutput3 BYTE "The numbers are equal.", 0

	number1 DWORD 42
	number2 DWORD 42

.CODE
_start:

    ; Display welcome message
    INVOKE OutputStr, ADDR strWelcome

    ; Prompt user for first number    
    INVOKE OutputStr, ADDR strInput
    INVOKE InputInt ; input is in eax
    MOV number1, eax ; store input in number1

    ; Display the numbers entered
    INVOKE OutputStr, ADDR strOutput1
    INVOKE OutputInt, number1
    INVOKE OutputStr, ADDR strNewLine


    ; Prompt user for second number
    INVOKE OutputStr, ADDR strInput
    INVOKE InputInt ; input is in eax
    MOV number2, eax ; store input in number2

    ; Display the numbers entered
    INVOKE OutputStr, ADDR strOutput1
    INVOKE OutputInt, number2
    INVOKE OutputStr, ADDR strNewLine

    ; Compare 
    MOV ebx, number1
    CMP ebx, number2 ; compare number1 and number2 (eax compared to number2)

    JE IsEqual ; jump if number 1 is equal to number 2 (i.e., eax == number2)
    JG OutputLarger ; jump if number 1 is greater than number 2 (i.e., eax > number2)

    ; if eax (number 1) is smaller, we set eax to number 2
    MOV ebx, number2
    JMP OutputLarger ; jump to output the larger number (number 2)

    IsEqual: 
    INVOKE OutputStr, ADDR strOutput3
    INVOKE OutputStr, ADDR strNewLine
    JMP EndCompare

    OutputLarger:
    INVOKE OutputStr,  ADDR strOutput2
    INVOKE OutputInt, ebx ; output the larger number (eax)
    INVOKE OutputStr, ADDR strNewLine

    EndCompare:
    INVOKE OutputStr, ADDR strClose

	INVOKE ExitProcess, 0
Public _start
END
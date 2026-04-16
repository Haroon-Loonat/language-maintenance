.386
.MODEL FLAT ; Flat memory model
.STACK 4096 ; 4096 bytes

; Exit Function
ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD

; IO LIbrary
INCLUDE ..\masm\src\io.inc

; Global variables
.DATA

    ; String prompts:
    strWelcome BYTE "Welcome!", 10, 0
    strClose BYTE "Bye!", 10, 0
    strNewLine BYTE 10, 0
    strAnd BYTE "The result of using AND operation:", 10, 0
    strXOR BYTE "The result of using XOR operation:", 10, 0
    strORr BYTE "The result of using OR operation:", 10, 0

    testValue1 BYTE 1 ; Binary = 0000 0001
    testValue2 BYTE 255 ; Binary = 1111 1111

.CODE
_start:

    ; Local variable
    PUSH ebp
    MOV ebp, esp
    SUB esp, 4 ; reserving 4 bytes for the local variable
    temp EQU DWORD PTR [ebp-4]

    ; Opening message
    INVOKE OutputStr, ADDR strNewLine
    INVOKE OutputStr, ADDR strWelcome
    INVOKE OutputStr, ADDR strNewLine

    ; NEED TO USE MOVZX SINCE SOURCE IS SMALLER THAN DESTINATION

    ; Use AND
    MOVZX eax, testValue1
    movzx ebx, testValue2
    AND eax, ebx ; 0000 0001 AND 1111 1111 = 0000 0001 = 1
    MOV temp, eax ; store the result in temp

    INVOKE OutputStr, ADDR strAnd
    INVOKE OutputInt, temp
    INVOKE OutputStr, ADDR strNewLine

    ; Use XOR

    MOVZX eax, testValue1
    MOVZX ebx, testValue2
    XOR eax, ebx ; 0000 0001 XOR 1111 1111 = 1111 1110 = 254
    MOV temp, eax ; store the result in temp

    INVOKE OutputStr, ADDR strXOR
    INVOKE OutputInt, temp
    INVOKE OutputStr, ADDR strNewLine

    ; Use OR
    MOVZX eax, testValue1
    MOVZX ebx, testValue2
    OR eax, ebx ; 0000 0001 OR 1111 1111 = 1111 1111 = 255
    MOV temp, eax ; store the result in temp

    INVOKE OutputStr, ADDR strORr
    INVOKE OutputInt, temp
    INVOKE OutputStr, ADDR strNewLine

    ; Closing message
    INVOKE OutputStr, ADDR strNewLine
    INVOKE OutputStr, ADDR strClose
    INVOKE OutputStr, ADDR strNewLine

    INVOKE ExitProcess, 0

Public _start
END
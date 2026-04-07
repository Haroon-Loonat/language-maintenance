.386
.MODEL FLAT ; Flat memory model
.STACK 4096 ; 4096 bytes

; Exit function
ExitProcess PROTO NEAR32 stdcall, dwExitCode:DWORD

; IO Library from the MASM folder
INCLUDE ..\masm\src\io.inc

; Global variables
.DATA

    ; String prompts:
    strWelcome BYTE "Welcome!", 10, 0
    strClose BYTE "Bye!", 10, 0
    strNewLine BYTE 10, 0

    strArrOutput BYTE "The content of the array is: ", 0
    strSmallestOutput BYTE "The smallest number in the array is: ", 0

    ; Array of 5 integers initialised to 5 hardcoded values
    intArray DWORD 7, 11, 12, 3, 8

.CODE
_start:

    ; Local variable for n in loop
    PUSH ebp
    MOV ebp, esp
    SUB esp, 8 ; reserving 8 bytes: n = 4 bytes, and smallest = 4 bytes
    n EQU DWORD PTR [ebp-4]
    smallest EQU DWORD PTR [ebp-8]

    ; Print welcome message
    INVOKE OutputStr, ADDR strNewLine
    INVOKE OutputStr, ADDR strWelcome
    INVOKE OutputStr, ADDR strNewLine

    ; Print array content message
    INVOKE OutputStr, ADDR strArrOutput
    INVOKE OutputStr, ADDR strNewLine


    ; Loop begin
    MOV n, 0 ; initialise n to 0

    ; initialise smallest to the first array entry
    MOV eax, intArray[0]
    MOV smallest, eax

    _LoopStart:
    CMP n, 4
    JG _LoopEnd ; if n > 4 jump to end of loop

    ; Value of array at index n
    MOV ebx, n
    IMUL ebx, 4 ; multiply by 4 to get byte offset
    MOV eax, intArray[ebx]

    ; See if value is smallest 
    CMP eax, smallest
    JG _SkipUpdate ; if eax > smallest, then jump and dont update

    MOV smallest, eax

    _SkipUpdate:

    ; Print value of array at index n
    INVOKE OutputInt, eax
    INVOKE OutputStr, ADDR strNewLine

    INC n
    JMP _LoopStart ; jump to start of loop
    _LoopEnd:

    ; Print smallest number in array
    INVOKE OutputStr, ADDR strSmallestOutput
    INVOKE OutputInt, smallest
    INVOKE OutputStr, ADDR strNewLine

    ; Print closing message
    INVOKE OutputStr, ADDR strNewLine
    INVOKE OutputStr, ADDR strClose
    INVOKE OutputStr, ADDR strNewLine
 
    INVOKE ExitProcess, 0 ; Exit the program with exit code 0

Public _start
END
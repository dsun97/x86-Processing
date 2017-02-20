; Assignment3.asm

; This is part one of the assignment dealing with unsigned integer variables
; Assignment # 3
; Objective: manipulate data with four UNSIGNED integer variables
; Author: David Sun 1573383
; Creation Date : 2/19/17
; Revisions: 2
; Date: 2/19/17

;template initializations
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode : DWORD

.data
; declare variables here
valueA dword 1000
valueB dword 500
valueC dword 450
valueD dword 100
sum dword 0

.code
main PROC ; main program

; Case 1: valueA=1000, valueB=500, valueC=450, valueD=100
mov eax, valueA ; move value of valueA to eax
mov ebx, valueB ; move value of valueB to ebx
add eax, ebx; add value of ebx to eax
mov ecx, valueC; move value of valueC to ecx
mov edx, valueD; move value of valueD to edx
add ecx, edx; add value of edx to ecx
sub eax, ecx; subtract value of ecx to eax
mov sum, eax; move value of eax to sum

; Case 2: valueA= - 2000, valueB= 100, valueC=1000, valueD=-500
mov valueA, -2000; move value of -2000 to valueA
mov valueB, 100; move value of 100 to valueB
mov valueC, 1000; move value of 1000 to valueC
mov valueD, -500; move value of -500 to valueD
mov eax, valueA 
mov ebx, valueB 
add eax, ebx
mov ecx, valueC
mov edx, valueD
add ecx, edx
sub eax, ecx
mov sum, eax; move value of eax to sum

; Case 3: valueA= 1000, valueB= 300, valueC= 2000, valueD= 500
mov valueA, 1000; move value of 1000 to valueA
mov valueB, 300; move value of 300 to valueB
mov valueC, 2000; move value of 2000 to valueC
mov valueD, 500; move value of 500 to valueD
mov eax, valueA
mov ebx, valueB
add eax, ebx
mov ecx, valueC
mov edx, valueD
add ecx, edx
sub eax, ecx
mov sum, eax; move value of eax to sum

	INVOKE ExitProcess,0
main ENDP
; end main program
END main

--------------------------------------------------------------------------------------------

; Objective: manipulate data using four signed integer variables
; Author: David Sun 1573383
; Creation Date : 2/19/17
; Revisions: 1
; Date: 2/19/17

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode : DWORD

.data

; declare variables here
svalueA sdword 1000
svalueB sdword 500
svalueC sdword 450
svalueD sdword 100
ssum sdword 0

.code
main PROC
; write your code here

; Case 1: valueA=1000, valueB=500, valueC=450, valueD=100
mov eax, svalueA; move value of svalueA to eax
mov ebx, svalueB; move value of svalueB to ebx
add eax, ebx; move value of ebx to eax
mov ecx, svalueC; move value of svalueC to ecx
mov edx, svalueD; move svalueD to edx
add ecx, edx; add value of edx to ecx
sub eax, ecx; subtract value of ecx to eax
mov ssum, eax; move value of eax to ssum

; Case 2: valueA= - 2000, valueB= 100, valueC=1000, valueD=-500
mov svalueA, -2000; move value of -2000 to svalueA
mov svalueB, 100; move value of 100 to svalueB
mov svalueC, 1000; move value of 1000 to svalueC
mov svalueD, -500; move value of -500 to svalueD
mov eax, svalueA
mov ebx, svalueB
add eax, ebx
mov ecx, svalueC
mov edx, svalueD
add ecx, edx
sub eax, ecx
mov ssum, eax

; Case 3: valueA= 1000, valueB= 300, valueC= 2000, valueD= 500
mov svalueA, 1000; move value of 1000 to svalueA
mov svalueB, 300; move value of 300 to svalueB
mov svalueC, 2000; move value of 2000 to svalueC
mov svalueD, 500; move value of 500 to svalueD
mov eax, svalueA
mov ebx, svalueB
add eax, ebx
mov ecx, svalueC
mov edx, svalueD
add ecx, edx
sub eax, ecx
mov ssum, eax

INVOKE ExitProcess, 0
main ENDP
; END
END main

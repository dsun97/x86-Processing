;Name: David Sun
;Course and Section: COMSC 260-1531
;A5 Part 1
;Write a program that prompts user to input upper and lower bounds 3 times, calls function BetterRandomRange 30 times, and output all results to the console window

.386      ;identifies minimum CPU for this program

.MODEL flat,stdcall    ;flat - protected mode program
                       ;stdcall - enables calling of MS_windows programs

;allocate memory for stack
;(default stack size for 32 bit implementation is 1MB without .STACK directive 
;  - default works for most situations)

.STACK 4096            ;allocate 4096 bytes (1000h) for stack

;*************************PROTOTYPES*****************************

ExitProcess PROTO,dwExitCode:DWORD  ;from Win32 api not Irvine

ReadChar PROTO                      ;Irvine code for getting a single char from keyboard
				    ;Character is stored in the al register.
			            ;Can be used to pause program execution until key is hit.
								    
								    
WriteHex PROTO                      ;Irvine function to write a hex number in EAX to the console
								    
WriteString PROTO                   ; write null-terminated string to console
                                    ; edx contains the address of the string to write
                                    ; before calling WriteString put the address of the string to write into edx
                                    ; e.g. mov edx, offset message ;address of message is copied to edx
								    
								    
WriteChar PROTO                     ;Irvine code for printing a single char to the console.
                                    ;Character to be printed must be in the al register.

INCLUDE Irvine32.inc; randomRange built in function					

.data; data section
 
lowerBound byte "Please enter the lower bound (integer only): " , 0; prompt user to enter lower bound
upperBound byte "Please enter the upper bound (integer only): " , 0; prompt user to enter upper bound

.code; code section

main PROC

mov ecx, 3; move value of 3 into ECX (loop counter)	

L1:						;loop configured to call function BetterRandomRange 30 times
	call BetterRandomRange			;calls BetterRandomRange function defined below
	call WriteInt				;call and print EAX value 
	call Crlf				;New line!

	loop L1					;Loop L1 until the counter reaches 0 (original value = 30)

	pop ecx					;push ECX value to stack 

	loop L2					;Loop L2 until the counter reaches 0 (original value = 3) 
	
	exit						

L2: 						;loop configured to prompt user 3 times for the upper and lower bounds

	mov edx, OFFSET lowBound		;move lower bound address to EDX register

	call WriteString			;print user inputted lower bound value
	call ReadInt				;call lower bound value into EAX 

	xchg eax, ebx				;exchanges upper bound value into EAX, and exchanges lower bound value into EBX

	mov ecx, 30				;move value of 30 to ECX (counter of 30)
	mov edx, eax				;move value of eax to edx

	push ecx				;push ECX value to stack 

	mov edx, OFFSET upBound			;moves upper bound value to printable EDX register
	
	call WriteString			;print upper bound value
	call ReadInt				;call upper bound value into EAX

	mov ebx, eax				;move value of eax into ebx (upper bound value into EBX)


main ENDP

;FUNCTIONS

BetterRandomRange proc				;define the function to be called

mov eax, edx					;move value of EDX into EAX
dec eax						;decrement the value in EAX
sub eax, ebx						

call RandomRange				;call function to get random value

add eax, ebx					;add lower bound value to the random value called in EAX

ret						;Returns EAX value

BetterRandomRange endp

END main

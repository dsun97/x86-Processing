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


.data
	
	array DWORD 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  ;array to be reversed

.code
main proc
    mov esi, 0
	mov edi, 0
	mov eax, 0
	mov ebx, 0

	mov esi, OFFSET array							;move first element address to esi
	mov edi, OFFSET array + SIZEOF array - TYPE array  ;move last element address to edi
	
	mov ecx, LENGTHOF array / 2     ;sets the counter in the reverseLoop

reverseLoop:
	mov eax, [esi]    ;move the element in esi to eax
	mov ebx, [edi]	  ;move the element in edi to ebx

	xchg eax, ebx     ;exchange the two elements

	mov [esi], eax  ;move the element in eax, to the address in esi
	mov [edi], ebx  ;move the element in ebx, to the address in edi

	add esi, TYPE array ;increase esi to take the next element in the array (from the left)
	sub edi, TYPE array ;decrease edi to take the next element in the array (from the right)

	loop reverseLoop

	invoke ExitProcess,0
main endp
end main

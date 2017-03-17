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

msg byte "Please enter the lower bound", 0 ;prompt user to enter lower bound
msg byte2 "Please enter the upper bound", 0 ;prompt user to enter lower bound

.code
main PROC
mov ebx, offset byte
mov eax, offset byte2



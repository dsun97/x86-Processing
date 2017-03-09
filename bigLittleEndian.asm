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
bigEndian       BYTE    12h, 34h, 56h, 78h
littleEndian    DWORD   ?

.code
main            PROC
    mov esi, OFFSET bigEndian
    mov eax, 0
    mov al, [esi+3]     ;Isolate 5678h
    mov ah, [esi+2]
    mov ebx, 0
    mov bl, [esi+1]     ;Isolate 1234h
    mov bh, [esi]

    mov esi, OFFSET littleEndian
    mov [esi], eax      ;Move 5678h into lower bits of littleEndian
    mov [esi+2], ebx    ;Move 1234h into higher bits of littleEndian      
    invoke  ExitProcess, 0
main        ENDP
END main

.data
	
	array DWORD 1, 5, 6, 8, 0Ah, 1Bh, 1Eh, 22h, 2Ah, 32h  ;array to be reversed

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
end main</pre>

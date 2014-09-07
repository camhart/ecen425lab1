; Modify AsmFunction to perform the calculation gvar+(a*(b+c))/(d-e).
; Keep in mind the C declaration:
; int AsmFunction(int a, char b, char c, int d, int e);

	CPU	8086
	align	2

AsmFunction:  
        push bp
        mov bp, sp   
 
	push bx
	push cx
	push dx
	mov	al, byte [bp+6]	;ax = b
	add	al, byte [bp+8]	;ax = b + c
	cbw			;sign extend al to fill ax
	
	imul	word [bp+4]

	mov	cx, [bp+10]
	sub	cx, [bp+12]	;

	idiv cx
	add ax, [gvar]
	
	pop dx
	pop cx
	pop bx
	; function tear down (ax ret register)
	mov sp, bp
        pop bp
	ret


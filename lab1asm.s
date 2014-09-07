; Modify AsmFunction to perform the calculation gvar+(a*(b+c))/(d-e).
; Keep in mind the C declaration:
; int AsmFunction(int a, char b, char c, int d, int e);

	CPU	8086
	align	2

AsmFunction:  
	;push bx
	;push cx
	;push dx
        push bp
        mov bp, sp   
        ; end function setup    
 
	push bx
	push cx
	push dx
	mov	al, byte [bp+6]	;ax = b
	add	al, byte [bp+8]	;ax = b + c
	cbw
	mov	bx, [bp+4]	;bx = a
	
	imul	bx

	;a*(b+c)

	mov	cx, [bp+10]
	sub	cx, [bp+12]	;

	;(d-e)=dx

	idiv cx
	add ax, [gvar]
	;;mov ax, [gvar]
;	;mov ax, dx
;	;mov	ax, [bp+4] ;arg1 int a
;	;mov     ax, [bp+6] ;arg2 char b
;	;mov     ax, [bp+8] ;arg3 char c
;	;mov     ax, [bp+10] ;arg4 int d
;	;mov     ax, [bp+12] ;arg5 int e
	
	pop dx
	pop cx
	pop bx
	; function tear down (ax ret register)
	mov sp, bp
        pop bp
	;pop dx
	;pop cx
	;pop bx
	ret


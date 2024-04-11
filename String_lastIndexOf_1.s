//-------------------------------------------------
// * Name: Kasim Rashid
// * Class: CS3B
// * rasm: String_indexOf_1
// * Date: 3/29/2024
//-------------------------------------------------

//int indexOf(String str): Returns the index of string str in a particular String.
/*
@ Subroutine String_length: Provided a pointer to a null terminated string, String_length will
@      return the length of the string in X0
@ X0: Must point to a null terminated string
@ LR: Must contain the return address
@ All AAPCS required registers are preserved,  r19-r29 and SP.
----------------------------------------------------------------
x0 -> null
x1 -> char (b(i)te)

*/

          .global String_lastIndexOf_1	// function call
      	.data	// data
         .text	// text

 String_lastIndexOf_1:	// FUNCTION CALL START
	stp	x19,x20,[sp,#-16]!	// push
	str	x21,[sp,#-16]!		// push
	mov	x19,x0			// x0 -> x19
	mov	x20,x1			// x1 -> x20
	mov 	x21,lr			// link	reg -> x21

	bl	String_length		// call string length
	mov	lr,x21			// link reg -> x21
	mov     x2,x0	// X2 -> 0
	mov	x0,x19			// x19 -> x0
	mov	x1,x20			// x20 -> x1

 	ldrb	w1,[x1]	// LOAD byte w1 -> x1

loop1:	// loop string size

// compare each char in string(x0) with x1

	ldrb	w4,[x0, x2];	// load w4 = x0 + x2


	cmp	w4,w1		// compare w4 with w1
	b.eq	loop2		// branch if =

 	sub	x2,x2,#1	// --x2



	cmp	x2,0x00		// compare w4 with null // space
	b.eq	loopy		// branch if =

	b 	loop1		// branch to top loop

loop2:		// ending loop


	mov	x0,x2	// x0 -> x2
	b	return	// JUMP to end
loopy:			// if ans is null
	mov	x0,#-1	// x0 -> -1


return:			// ending jump

	ldr	x21,[sp],#16	// pop
	ldp	x19,x20,[sp],#16	// pop
	RET	LR	// return to the world
.end	// end












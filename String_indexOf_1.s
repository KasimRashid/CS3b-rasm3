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

          .global String_indexOf_1	// function call
      	.data	// data
         .text	// text

 String_indexOf_1:	// FUNCTION CALL START
	mov     x2,#0	// X2 -> 0

 	ldrb	w1,[x1]	// LOAD byte w1 -> x1

loop1:	// loop string size

// compare each char in string(x0) with x1

	ldrb	w4,[x0, x2];	// load w4 = x0 + x2


	cmp	w4,w1		// compare w4 with w1
	b.eq	loop2		// branch if =

 	add	x2,x2,#1	// add ++x2



	cmp	w4,0x00		// compare w4 with null
	b.eq	loopy		// branch if =

	b 	loop1		// branch to top loop

loop2:		// ending loop


	mov	x0,x2	// x0 -> x2
	b	return	// JUMP to end
loopy:			// if ans is null
	mov	x0,#-1	// x0 -> -1


return:			// ending jump

	RET	LR	// reset
.end	// end


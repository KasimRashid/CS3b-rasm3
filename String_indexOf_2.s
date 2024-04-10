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
 -> null
 x1 -> char (byte)
 */
         .global String_indexOf_2 //function
         .data		//data
         .text		// text

  String_indexOf_2:	// function call

	ldr	x3,#0
          mov     x3,x2		// x3 -> x2// for index
          ldrb    w1,[x1]	// load byte x1 -> w1
  loop1:

  // compare each char in string(x0) with x1

          ldrb    w4,[x0, x3];	// load byte w4 = x0 + x3

          cmp     w4,w1		// compare w4 and w1
          b.eq    loop2		// branch if equal to loop2


          add     x3,x3,#1	// ++x3

          cmp     w4,0x00	// compare w4 with null
          b.eq    loopy		// branch if equal to loopy end

          b       loop1		// else jump to loop1

  loop2:			//  outside to loop

          mov     x0,x3		// x0 -> x3
	sub	x0,x0,x2	// x0-=x2
          b       return	// branch to end
  loopy:			// null ending
          mov     x0,#-1	// x0 = -1


  return:			// return
          RET     LR		// reset
  .end				// end





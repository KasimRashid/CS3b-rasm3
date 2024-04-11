    .global String_lastIndexOf_2  // function call
         .data   // data
          .text  // text

  String_lastIndexOf_2:  // FUNCTION CALL START

	ldr	x3,#0
	mov	x3,x2
         ldrb    w1,[x1] // LOAD byte w1 -> x1

 loop1:  // loop string size

 // compare each char in string(x0) with x1

         ldrb    w4,[x0, x3];//or x2    // load w4 = x0 + x2


         cmp     w4,w1           // compare w4 with w1
         b.eq    loop2           // branch if =

         sub     x3,x3,#1        // --x3

         cmp     x3,0x00         // compare w4 with null // space
         b.eq    loopy           // branch if =

        b       loop1           // branch to top loop

 loop2:          // ending loop

         mov     x0,x3   // x0 -> x2
         b       return  // JUMP to end
 loopy:                  // if ans is null
         mov     x0,#-1  // x0 -> -1


 return:                 // ending jump

         RET     LR      // return to the world
 .end    // end




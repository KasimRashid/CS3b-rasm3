/*
    Subroutine String_startsWith_2: Provided a pointer to a null terminated string
    in x0 and a null terminated prefix in x1
    String_startsWith_2 with return 1 if the prefix in x1 is the begenning of
    the string in x0, and 0 if it is not

    X0: Must point to a null terminated string
    X1: Must point to a null terminated prefix
    LR: Must contain the return address
    All AAPCS required registers are preserved,  r19-r29 and SP.
 */

	.global String_startsWith_2

	.data
	.text
String_startsWith_2:

    mov x2,0x0                  //Initialize to 0

    String_startsWith_2_loop:

        ldrb w3,[x0, x2]        //Load a byte into w3 from x0
        ldrb w4,[x1, x2]        //Load a byte into w4 from x1

        cmp w3, w4              //Compare the characters
        b.ne string_not_equal   //Branch if they are not equal

        add x2, x2, #1          //Incriment

        ldrb w4,[x1, x2]        //Load a byte into w4 from x1
        cmp w4, 0x0             //Compare to 0
        b.eq string_are_equal   //Exit if they are equal

        b String_startsWith_2_loop  //Branch to the top of the loop

    string_not_equal:
    mov x0,0x0                      //Return 0
    b String_startsWith_2_return    //Branch to the return

    string_are_equal:
    mov x0,0x1                      //Return 1

    String_startsWith_2_return:
    ret lr                          //Return
	.end

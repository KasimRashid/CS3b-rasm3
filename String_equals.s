/*
    Subroutine String_equals: Provided 2 pointers to null terminated strings in x0 and x1, 
    String_equals will return a bool in x0, 1 if they are equal, 0 if they are not

    X0: Must point to a null terminated string
    X1: Must point to a null terminated string
    LR: Must contain the return address
    All AAPCS required registers are preserved,  r19-r29 and SP.
 */

	.global String_equals

	.data
	.text
String_equals:

    mov x2,0x0  //Initialize x2 to 0

    string_equals_loop:
        ldrb w3,[x0, x2]        //Load a character into w3 at index x2
        ldrb w4,[x1, x2]        //Load a character into w4 at index x2

        cmp w3, w4              //Compare the two characters
        b.ne string_not_equal   //If they are not equal, return 0

        cmp w3, 0x0             //Check that the string is not null
        b.eq string_are_equal   //Return 1 if they are

        add x2, x2, #1          //x2++

        b string_equals_loop    //Branch to the top of the loop

    string_not_equal:
    mov x0,0x0                  //Load 0
    b string_equals_return      //Branch to the return

    string_are_equal:
    mov x0,0x1                  //Load 1
    b string_equals_return      //Branch to the return

    string_equals_return:
    ret lr                      //Return
	.end

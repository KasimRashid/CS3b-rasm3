/*
    Subroutine String_equalsIgnoreCase: Provided 2 pointers to null terminated strings in x0 and x1, 
    String_equalsIgnoreCase will return a bool in x0, 1 if they are equal, 0 if they are not

    X0: Must point to a null terminated string
    X1: Must point to a null terminated string
    LR: Must contain the return address
    All AAPCS required registers are preserved,  r19-r29 and SP.
 */

	.global String_equalsIgnoreCase

	.data
	.text
String_equalsIgnoreCase:
    stp x19, x20, [sp, #-16]!   //Push x19, x20

    mov x20, lr                 //Preserve the lr
    mov x19, x1                 //Preserve x1
    bl String_toLowerCase       //Branch and link to String_toLowerCase
    str x0,[sp, #-16]!          //Push x0
    mov x1, x19                 //Save x19
    mov x19, x0                 //Move x0 into x19
    mov x0, x1                  //Move x1 into x0
    bl String_toLowerCase       //Branch and link to String_toLowerCase
    str x0,[sp, #-16]!          //Push x0
    mov lr, x20                 //Re point the lr
    mov x2,0x0                  //Initialize x2 to 0
    mov x1, x19                 //Move x19 into x1

    string_equalsIgnoreCase_loop:
        ldrb w3,[x0, x2]        //Load a character into w3 at index x2
        ldrb w4,[x1, x2]        //Load a character into w4 at index x2

        cmp w3, w4              //Compare the two characters
        b.ne string_not_equalIgnoreCase   //If they are not equal, return 0

        cmp w3, 0x0             //Check that the string is not null
        b.eq string_are_equalIgnoreCase   //Return 1 if they are

        add x2, x2, #1          //x2++

        b string_equalsIgnoreCase_loop    //Branch to the top of the loop

    string_not_equalIgnoreCase:
    mov x19,0x0                  //Load 0
    b string_equalsIgnoreCase_return      //Branch to the return

    string_are_equalIgnoreCase:
    mov x19,0x1                  //Load 1
    b string_equalsIgnoreCase_return      //Branch to the return

    string_equalsIgnoreCase_return:
    mov x20, lr         //Preserve the lr
    ldr x0,[sp], #16    //Pop into x0
    bl free             //Branch and link to free
    ldr x0,[sp], #16    //Pop into x0
    bl free             //Branch and link to free
    mov lr, x20         //Re point the lr
    mov x0, x19         //Move the answer into x0
    ldp x19, x20, [sp], #16 //Pop x19 and x20
    ret lr                  //Return
	.end

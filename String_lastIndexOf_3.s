/*
    Subroutine String_lastIndexOf_3: Provided 2 pointers to null terminated strings in x0 and x1, 
    String_lastIndexOf_3 will return the last index of where the provided substring appears in x0

    X0: Must point to a null terminated string
    X1: Must point to a null terminated string
    LR: Must contain the return address
    All AAPCS required registers are preserved,  r19-r29 and SP.
 */

	.global String_lastIndexOf_3

	.data
	.text
String_lastIndexOf_3:
    stp x19, x20, [sp, #-16]!   //Push x19, x20
    stp x21, x22, [sp, #-16]!   //Push x21, x22
    
    mov x19, x0         //Preserve x0
    mov x20, x1         //Preserve x1
    mov x22, lr         //Preserve the lr
    bl String_length    //Branch and link to string length
    mov x2, x0          //Move the size into x2
    mov lr, x22         //Re point the lr
    mov x0, x19         //Re point x0 to sz1
    mov x1, x20         //Re point x1 to sz2
    sub x2, x2, #1      //Sub 1 from the size to get the index
    mov x5, 0x0         //Initialize to 0
    b string_lastIndexOf_3_loop_1   //Branch to the start of the loop

    string_lastIndexOf_3_loop_1_reset:
    mov x5, 0x0     //Initialize to 0
    mov x2, x6      //Re initialize the index
    string_lastIndexOf_3_loop_1:
        ldrb w3, [x0, x2]   //Load a char into w3
        ldrb w4, [x1, x5]   //Load a char into w4

        cmp w3, w4                              //Compare the characters
        b.eq string_lastIndexOf_3_loop_2_start  //Branch if equal

        cmp x2, 0x0                         //Compare w3 to 0
        b.eq string_lastIndexOf_3_not_equal //Branch if equal

        
        sub x2, x2, #1                      //Decrement the counter
        b string_lastIndexOf_3_loop_1       //Branch to the top of the loop

    string_lastIndexOf_3_loop_2_start:
    mov x6, x2                          //Save the index

    string_lastIndexOf_3_loop_2:
        add x2, x2, #1                  //Decrement the counters
        add x5, x5, #1                  //Decrement the counters

        ldrb w3, [x0, x2]               //Load a char into w3
        ldrb w4, [x1, x5]               //Load a char into w4

        cmp w4, 0x0                         //Compare w4 to 0
        b.eq string_lastIndexOf_3_equal     //Branch if equal

        cmp w3, w4                              //Compare the characters
        b.ne string_lastIndexOf_3_loop_1_reset  //Branch if not equal

        cmp w3,0x0                              //Compare w3 to 0
        b.eq string_lastIndexOf_3_not_equal     //Branch if equal

        b string_lastIndexOf_3_loop_2           //Branch to the top of the loop

    string_lastIndexOf_3_equal:
    sub x0, x2, x5                  //Compute the index
    b string_lastIndexOf_3_return   //Branch to the return

    string_lastIndexOf_3_not_equal: 
    mov x0,#-1                      //Move -1 into x0
    b string_lastIndexOf_3_return   //Branch to the return

    string_lastIndexOf_3_return:
    ldp x21, x22, [sp], #16     //Pop x21, x22
    ldp x19, x20, [sp], #16     //Pop x19, x20
    ret lr                      //Return
	.end

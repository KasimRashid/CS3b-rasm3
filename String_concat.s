/*
    Subroutine String_concat: Provided two pointers to null terminated strings in x0 and x1
    String_concat will allocate memory for the total length of them and return a new
    string of x0 + x1

    X0: Must point to a null terminated string
    X1: Must point to a null terminated string
    LR: Must contain the return address
    All AAPCS required registers are preserved,  r19-r29 and SP.
 */

	.global String_concat

	.data
	.text
String_concat:
    stp x19, x20, [sp, #-16]!   //Push x19, x20
    stp x21, x22, [sp, #-16]!   //Push x21, x22
    str x23, [sp, #-16]!         //Push x23

    mov x19, x0         //Preserve x0
    mov x20, x1         //Preserve x1
    mov x21, lr         //Preserve the lr

    bl String_length    //Find the length of x0
    mov lr, x21         //Re point the lr
    mov x21, x0         //Preserve the length of x0

    mov x0, x20         //Point x0 to string 2
    mov x22, lr         //Preserve the lr
    bl String_length    //Find the length of string 2
    mov lr, x22         //Re point the lr
    mov x22, x0         //Preserve the length of string 2

    add x0, x0, #1      //Add 1 to include the null
    add x0, x0, x21     //Get the total length of str1 + str2
    mov x23, lr         //Preserve the lr

    bl malloc           //Allocate memory for the new string

    mov lr, x23         //Re point the lr
    mov x3, 0x0         //Initialize the first counter
    mov x4, 0x0         //Initialize the second counter

    string_concat_loop_1:
        cmp x3, x21                     //Compare the counter to the length of str 1
        b.eq string_concat_loop_1_end   //Branch if equal to the end of loop 1
    
        ldrb w1, [x19, x3]              //Load a character from str1 into w1
        strb w1, [x0, x3]               //Store the character in the new string

        add x3, x3, #1                  //Incriment the counter
        b string_concat_loop_1          //Branch to the top of the loop

    string_concat_loop_1_end:


    string_concat_loop_2:
        cmp x4, x22                     //Compare the second counter to the length of str2
        b.eq string_concat_loop_2_end   //Branch if equal to the end of loop 2

        ldrb w1, [x20, x4]              //Load a character from str2 into w1
        strb w1, [x0, x3]               //Store the character into the new string

        add x3, x3, #1                  //Incriment the counter
        add x4, x4, #1                  //Incriment the second counter
        b string_concat_loop_2          //Branch to the top of the loop

    string_concat_loop_2_end:

    string_concat_return:
    ldr x23, [sp], #16          //Pop x23
    ldp x21, x22, [sp], #16     //Pop x21, x22
    ldp x19, x20, [sp], #16     //Pop x19, x20
    ret lr              //Return
	.end

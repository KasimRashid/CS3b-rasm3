/*
    Subroutine String_toLowerCase: Provided a pointer to a null terminated string in x0,
    String_toUpperCase will allocate memory for a new string, and convert any lowercase
    letter to its upper case

    X0: Must point to a null terminated string
    LR: Must contain the return address
    All AAPCS required registers are preserved,  r19-r29 and SP.
 */

	.global String_toUpperCase

	.data
	.text
String_toUpperCase:
    stp x19, x20, [sp, #-16]!   //Push x19, x20
    str x21, [sp, #-16]!        //Push x19, x20

    mov x19, x0         //Preserve x0
    mov x20, lr         //Preserve the lr
    bl String_length    //Find the length of x0
    add x0, x0, #1      //Add 1 to include the null
    mov lr, x20         //Re point the lr
    mov x20, x0         //Preserve the length of x0
    mov x21, lr         //Preserve the lr

    bl malloc           //Branch and link to malloc
    mov lr, x21         //Re point the lr

    mov x3, 0x0         //Initialize the first counter
    string_toUpperCase_loop1:
        cmp x3, x20                         //Compare the counter to the length of str 1
        b.eq string_toUpperCase_loop1_end   //Branch if equal to the end of loop 1

        ldrb w1, [x19, x3]                  //Load a character from str1 into w1
        strb w1, [x0, x3]                   //Store the character in the new string

        add x3, x3, #1                      //Incriment the counter
        b string_toUpperCase_loop1          //Branch to the top of the loop

    string_toUpperCase_loop1_end:

    mov x3, 0x0         //Initialize the first counter
    string_toUpperCase_loop2:
        cmp x3, x20                         //Compare the counter to the length of str 1
        b.eq string_toUpperCase_loop2_end   //Branch if equal to the end of loop 2

        ldrb w1,[x0, x3]                        //Load a character into w1 from x0
        cmp w1, 0x61                            //Compare the character to a
        b.ge string_toUpperCase_isGreaterThan   //Branch if greater than 
        b string_toUpperCase_incriment          //Else branch to the incriment

        string_toUpperCase_isGreaterThan:
        sub w1, w1, 0x20                    //Sub 20 in hex to convert to the lower case
        strb w1,[x0, x3]                    //Store the lowercase char into x0

        string_toUpperCase_incriment:   
        add x3, x3, #1                      //Incriment the counter
        b string_toUpperCase_loop2          //Branch to the top of the loop
    
    string_toUpperCase_loop2_end:

    String_toUpperCase_return:
    ldr x21, [sp], #16          //Pop x21
    ldp x19, x20, [sp], #16     //Pop x19, x20
    ret lr                      //Return
	.end

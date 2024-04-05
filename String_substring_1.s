/*
    Subroutine String_substring_1: Provided a pointer to a null terminated string in x0,
    a starting index in x1, and an ending index in x2 String_substring_1 will dynamically 
    allocate enough memory for the substring and return a pointer to it in x0

    X0: Must point to a null terminated string
    X1: Must contain a binary signed starting index
    X2: Must contain a binary signed ending index
    LR: Must contain the return address
    All AAPCS required registers are preserved,  r19-r29 and SP.
 */

	.global String_substring_1

	.data
	.text
String_substring_1:

    //Need to push x19, x20, lr(x30)
    stp x19, x20, [sp, #-16]!    //Push x19
    stp x21, x22, [sp, #-16]!    //Push x21

    //Find string length of string
    mov x19, x0         //x19 = x0
    mov x20, x1         //X20 = x1
    mov x21, x2         //X21 = x2
    mov x22, x30        //Preserve lr
    bl String_length    //Branch and link to String_length
    mov x30, x22        //Re-point lr to next addr

    sub x0, x21, x20    //Find delta length
    add x0, x0, #1      //Add 1 to include the null     
    mov x22, x30        //Preserve lr
    bl malloc           //Branch and link to malloc
    mov x30, x22        //Re-point lr to next addr
    
    add x21, x21, #1    //Add 1 to the total length of the string

    string_substring_1_loop:
        cmp x20, x21                        //Compare the index to the length
        b.eq string_substring_1_return      //Branch if equal

        ldrb w1,[x19, x20]                  //Load a byte from x19 into w1
        strb w1,[x0, x20]                   //Store the byte in x0
        
        add x20, x20, #1                    //Incriment the counter

        b string_substring_1_loop           //Branch to the top of the loop                

    string_substring_1_return:
    ldp x21, x22, [sp], #16      //Pop x21, x22
    ldp x19, x20, [sp], #16      //Pop x19, x20
    ret lr                  //Return

	.end

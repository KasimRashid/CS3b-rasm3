/*
    Subroutine String_copy: Provided a pointer to a null terminated strings in x0, 
    String_copy will dynamically allocate enough memory for the copy and return
    a pointer to it in x0

    X0: Must point to a null terminated string
    LR: Must contain the return address
    All AAPCS required registers are preserved,  r19-r29 and SP.
 */

	.global String_copy

	.data
	.text
String_copy:

    //Need to push x19, x20, lr(x30)
    str x19, [sp, #-16]!    //Push x19
    str x21, [sp, #-16]!    //Push x21
    str x22, [sp, #-16]!    //Push x22

    //Find string length of string
    mov x19, x0         //x19 = x0
    mov x21, x30        //Preserve lr
    bl String_length    //Branch and link to String_length
    mov x30, x21        //Re-point lr to next addr

    mov x22, x0         //Save the length of the string
    add x0, x0, #1      //Add 1 to include the null
    mov x21, x30        //Preserve lr
    bl malloc           //Branch and link to malloc
    mov x30, x21        //Re-point lr to next addr
    
    mov x4, x22         //Move the size back into a register
    mov x1, x19         //Move the original string into x1
    mov x3, 0x0         //Initialize a counter

    string_endWith_loop:
        cmp x3, x4                 //Compare the length of the prefix to 0
        b.eq string_copy_return    //Branch if at the end of the string

        ldrb w5,[x1, x3]            //Load a byte from x0 into w3
        strb w5,[x0, x3]            //Store the byte in x0
        
        add x3, x3, #1              //Incriment the counter

        b string_endWith_loop       //Branch to the top of the loop


    string_copy_return:
    ldr x19, [sp], #16      //Pop x19
    ldr x21, [sp], #16      //Pop x21
    ldr x22, [sp], #16      //Pop x22
    ret lr                  //Return

	.end

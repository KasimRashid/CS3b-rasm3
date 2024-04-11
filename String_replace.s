/*
    Subroutine String_replace: Provided a pointer to a null terminated string in x0
    an old character in w1, and a new character in w2 String_replace will dynamically 
    allocate enough memory for the substring and return a pointer to it in x0

    X0: Must point to a null terminated string
    W1: Must contain a an old character
    W2: Must contain a new character
    LR: Must contain the return address
    All AAPCS required registers are preserved,  r19-r29 and SP.
 */

	.global String_replace

	.data
	.text
String_replace:

    stp x19, x20, [sp, #-16]!   //Push x19, x20
    str x21, [sp, #-16]!        //Push x21
    
    mov x19, x1     //Preserve x1
    mov x20, x2     //Preserve x2
    mov x21, x30    //Preserve the lr
    bl String_copy  //Branch and link to string copy
    mov x30, x21    //Re point the lr
    mov x1, x19     //Move x19 back into x1
    mov x2, x20     //Move x20 back into x2
    ldrb w1,[x1]
    ldrb w2,[x2]
    mov x4, 0x0     //Initialize x4 to 0

    string_replace_loop:
        ldrb w3,[x0, x4]            //Load a byte from x0 into w3 

        cmp w3, w1                  //Compare to the old character
        b.eq string_replace_replace //Branch if equal
        b string_replace_loop_inc   //Branch to incriment x4

        string_replace_replace:
        strb w2, [x0, x4]           //Store a byte from w2 into x0

        string_replace_loop_inc:
        add x4, x4, #1              //Incriment the counter

        cmp w3, 0x0                 //Compare w3 to a null
        b.eq string_replace_return  //If equal branch to the return
        b string_replace_loop       //Else branch to the top of the loop

    string_replace_return:

    ldr x21, [sp], #16          //Pop x21
    ldp x19, x20, [sp], #16     //Pop x19, x20

    ret lr                      //Return

	.end

/*
    Subroutine String_charAt: Provided a pointer to null terminated string in x0 and a
    binary signed value in x1, String_charAt will return the char at index x1 in x0,
    and -1 if the index is out of bounds

    X0: Must point to a null terminated string
    X1: Must contain the binary signed index
    LR: Must contain the return address
    All AAPCS required registers are preserved,  r19-r29 and SP.
 */

	.global String_charAt

	.data
	.text
String_charAt:

    //Need to push registers
    str x19, [sp, #-16]!    //Push x19
    str x20, [sp, #-16]!    //Push x20
    str x21, [sp, #-16]!    //Push x21

    mov x19, x0         //Preserve x0
    mov x20, x1         //Preserve x1
    mov x21, x30        //Preserve lr
    bl String_length    //Branch and link to String_length
    mov x30, x21        //Re-point the lr
    
    cmp x0, x20                     //Compare the length of the string
    b.lt string_charAt_outOfBounds  //Branch if it is out of bounds
    ldrb w0, [x19, x20]             //Load a byte from x19 at index 
    b string_charAt_return          //Branch to the return

    string_charAt_outOfBounds:
    mov x0, #-1             //If the index is out of bounds return -1
    b string_charAt_return  //Branch to the return

    string_charAt_return:
    ldr x19, [sp], #16  //Pop x19
    ldr x20, [sp], #16  //Pop x20
    ldr x21, [sp], #16  //Pop x21

    ret lr              //Return
	.end

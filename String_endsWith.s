/*
    Subroutine String_endWith: Provided 2 pointers to null terminated strings in x0 and x1, 
    String_endWith will return a bool in x0, 1 if x1 is a suffix of x0, 0 if it is not

    X0: Must point to a null terminated string
    X1: Must point to a null terminated string
    LR: Must contain the return address
    All AAPCS required registers are preserved,  r19-r29 and SP.
 */

	.global String_endWith

	.data
	.text
String_endWith:

    //Need to push x19, x20, lr(x30)
    stp x19, x20,[sp, #-16]!
    stp x21, x22,[sp, #-16]!

    //Find string length of string
    mov x19, x0         //x19 = x0
    mov x20, x1         //x20 = x1
    mov x21, x30        //Preserve lr
    bl String_length    //Branch and link to String_length
    mov x30, x21        //Re-point lr to next addr
    mov x22, x0

    mov x0, x20          //x0 = x1
    mov x21, x30        //Preserve lr
    bl String_length    //Branch and link to String_length
    mov x30, x21        //Re-point lr to next addr

    mov x6, x0          //x6 = sizeOf(x20)
    mov x5, x22         //x5 = sizeOf(x19)
    mov x0, x19         //x0 = x19
    mov x1, x20         //x1 = x20

    sub x5, x5, #1      //Subtract to get the last index
    sub x6, x6, #1      //Subtract to get the last index

    string_endWith_loop:
        cmp x6, 0x0                 //Compare the length of the prefix to 0
        b.eq string_endWith_true    //Branch if at the end of the string

        ldrb w3,[x0, x5]            //Load a byte from x0 into w3
        ldrb w4,[x1, x6]            //Load a byte from x1 into w4

        cmp w3, w4                  //Compare the characters
        b.ne string_endWith_false   //If they aren't equal branch
        
        sub x5, x5, #1              //Decrement
        sub x6, x6, #1              //Decrement

        b string_endWith_loop       //Branch to the top of the loop

    string_endWith_true:
    mov x0, #1                      //Else return 1
    b string_endWith_return         //Branch to the return

    string_endWith_false:
    mov x0,0x0                      //If not equal return 0

    string_endWith_return:
    ldp x21, x22, [sp], #16
    ldp x19, x20, [sp], #16
    ret lr                      //Return

	.end

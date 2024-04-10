/*
    Subroutine String_indexOf_3: Provided 2 pointers to null terminated strings in x0 and x1, 
    String_indexOf_3 will return the first index of where the provided substring appears in x0

    X0: Must point to a null terminated string
    X1: Must point to a null terminated string
    LR: Must contain the return address
    All AAPCS required registers are preserved,  r19-r29 and SP.
 */

	.global String_indexOf_3

	.data
	.text
String_indexOf_3:
    mov x2, 0x0     //Initialize to 0
    
    string_indexOf_3_loop_1_reset:
    mov x5, 0x0     //Initialize to 0
    string_indexOf_3_loop_1:
        ldrb w3, [x0, x2]   //Load a char into w3
        ldrb w4, [x1, x5]   //Load a char into w4

        cmp w3, w4                      //Compare the characters
        b.eq string_indexOf_3_loop_2    //Branch if equal

        cmp w3, 0x0                     //Compare w3 to 0
        b.eq string_indexOf_3_not_equal //Branch if equal

        cmp w4,0x0                      //Compare w4 to 0
        b.eq string_indexOf_3_equal     //Branch if equal
        
        add x2, x2, #1                  //Incriment the counter
        b string_indexOf_3_loop_1       //Branch to the top of the loop

    string_indexOf_3_loop_2:
        add x2, x2, #1                  //Incriment the counters
        add x5, x5, #1                  //Incriment the counters

        ldrb w3, [x0, x2]               //Load a char into w3
        ldrb w4, [x1, x5]               //Load a char into w4

        cmp w4, 0x0                     //Compare w4 to 0
        b.eq string_indexOf_3_equal     //Branch if equal

        cmp w3, w4                      //Compare the characters
        b.ne string_indexOf_3_loop_1_reset  //Branch if not equal

        cmp w3,0x0                          //Compare w3 to 0
        b.eq string_indexOf_3_not_equal     //Branch if equal

        b string_indexOf_3_loop_2           //Branch to the top of the loop

    string_indexOf_3_equal:
    sub x0, x2, x5              //Subtract to find the index
    b string_indexOf_3_return   //Branch to the return

    string_indexOf_3_not_equal: 
    mov x0,#-1                  //Move -1 into x0
    b string_indexOf_3_return   //Branch to the return

    string_indexOf_3_return:
    ret lr                      //Return
	.end

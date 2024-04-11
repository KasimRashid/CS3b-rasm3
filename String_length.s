	.global String_length

	.data

	.text
String_length:
    //loop while next char != NULL
    //While(x0->next != NULL)
    //  x1++
    //  x0 = x0->next
    //x0 = x1
    //return x0

    mov x1,0x0
    mov x2, 0x0
    loop:       //loop to check the character input
        ldrb w2,[x0, x1]    //Load a byte of data from x0 offset by x1 into w2

        cmp w2, 0x00            //Compare w2 to 0x00
        b.eq loopEnd            //Branch to loopEnd if the value is less than

        add x1, x1, #1      //i++

        b loop      //Branch to loopEnd

    loopEnd:

    mov x0,x1   //Move the value back into x0

    ret lr  //Return from the function
    
	.end

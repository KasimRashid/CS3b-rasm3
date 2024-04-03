	.global _start

    .equ BUFFER, 21     //Max buffer length

	.data

    szProgName:     .asciz "Name: Ilyas Zuhuruddin" //Name of programmer
    szClass:        .asciz "Class: CS 3B"           //Class
    szLab:          .asciz "Lab: Lab11"              //Lab number
    szDate:         .asciz "Date: 4/3/2024"         //Date

    szX: .asciz "Cat"           //String 1
    szY: .asciz "in the hat."   //String 2
    ptrString: .quad 0          //Pointer

    chLF:   .byte 0xa   //Hex for line feed
	.text
_start:
    ldr x0,=szProgName  //Load x0 with the address of szProgName
    bl putstring        //Branch and link to putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=szClass     //Load x0 with the address of szClass
    bl putstring        //Branch and link to putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=szLab       //Load x0 with the address of szLab
    bl putstring        //Branch and link to putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=szDate      //Load x0 with the address of szDate
    bl putstring        //Branch and link to putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    ldr x0,=szX         //Point x0 to szX
    bl String_length    //Branch and link to String_length
    mov x8, x0          //Move the result into x8

    ldr x0,=szY         //Point x0 to szY
    bl String_length    //Branch and link to String_length
    mov x9, x0          //Move the result into x9

    add x10, x8, x9     //Find the total length

    str x8,[sp, #-16]!  //Push x8
    str x9,[sp, #-16]!  //Push x9
    str x10,[sp, #-16]! //Push x10

    mov x0, x10         //Move the size into x0
    bl malloc           //Branch and link to malloc

    ldr x2,=ptrString   //Point x2 to ptrString
    str x0,[x2]         //Store the result inside

    ldr x10,[sp], #16   //Pop x10
    ldr x9,[sp], #16    //Pop x9
    ldr x8,[sp], #16    //Pop x8

    mov x4, 0x0         //Initialize x4 to 0
    ldr x0,=szX         //Point x0 to szX
    ldr x1,=ptrString   //Point x1 to ptrString
    ldr x1,[x1]         //Get the memory addr inside

    lab11_loop:     
        cmp x4, x8          //Compare the index and the size of the first string
        b.eq lab11_loop_end //If they are equal exit the loop

        ldrb w2,[x0, x4]    //Load a byte from x0 offset by x4
        str w2, [x1, x4]    //Store the byte into x1
        
        add x4, x4, #1      //Incriment the counter
        b lab11_loop        //Branch to the top of the loop

    lab11_loop_end:

    mov x0, 0x20        //Move hex for ' ' into x0
    strb w0, [x1, x4]   //Store it into x1

    ldr x0,=szY         //Point x0 to szY
    mov x3, 0x0         //Initialize another counter to 0
    add x4, x4, #1      //Incriment x4
    add x10, x10, #1    //Incriment the total

    lab11_loop2:
        cmp x4, x10     //Compare the index to the total length of the strings
        b.eq lab11_loop_end2    //If it is equal leave the loop

        ldrb w2,[x0, x3]        //Load a byte from x0 offset by x3
        str w2, [x1, x4]        //Store it into x1
        
        add x4, x4, #1          //Incriment
        add x3, x3, #1          //Incriment
        
        b lab11_loop2           //Branch to the top of the loop

    lab11_loop_end2:

    mov x0, x1      //Move the result into x0
    bl putstring    //Display it    
    ldr x0,=chLF    //Point x0 to chLF
    bl putch        //Branch and link to putch

    ldr x0,=ptrString   //Free the memory
    ldr x0,[x0]         //Free the memory
    bl free             //Free the memory

	// Setup the parameters to exit the program
	// and then call Linux to do it.
    mov X0, #0 // Use 0 return code
    mov X8, #93 // Service code 93 terminates
    svc 0 // Call Linux to terminate
    
	.end

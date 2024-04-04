	.global _start

    .equ BUFFER, 21     //Max buffer length

	.data

    szProgName:     .asciz "Name: Ilyas Zuhuruddin"                     //Name of programmer
    szClass:        .asciz "Class: CS 3B"                               //Class
    szLab:          .asciz "Lab: Lab 12"                                //Lab number
    szDate:         .asciz "Date: 4/4/2024"                             //Date
    szPrompt:       .asciz "Enter a number to compute factorial of: "   //Prompt
    szBuffer:       .skip BUFFER                                        //String buffer
    dbi:            .quad 0

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

        ldr x0,=szPrompt    //Load x0 with the address of szPrompt
        bl putstring        //Branch and link to putstring

        ldr x0,=szBuffer    //Point x0 to szBuffer
        mov x1, BUFFER      //Move the size of BUFFER into x1
        bl getstring        //Branch and link to getstring

        ldr x0,=szBuffer    //Point x0 to szBuffer
        bl ascint64         //Branch and link to ascint64

        bl factorial        //Branch and link to factorial

        ldr x1,=szBuffer    //Point x1 to szBuffer
        bl int64asc         //Branch and link to int64asc
        ldr x0,=szBuffer    //Point x0 to szBuffer
        bl putstring        //Branch and link to putstring
        ldr x0,=chLF        //Load x0 with the address of chLF
        bl putch            //Branch and link to putch

	// Setup the parameters to exit the program
	// and then call Linux to do it.
    mov X0, #0 // Use 0 return code
    mov X8, #93 // Service code 93 terminates
    svc 0 // Call Linux to terminate
    
	.end

	.global _start

    .equ BUFFER, 21     //Max buffer length

	.data

    szProgName:     .asciz "Name: Ilyas Zuhuruddin" //Name of programmer
    szClass:        .asciz "Class: CS 3B"           //Class
    szLab:          .asciz "Lab: Rasm 3"            //Lab number
    szDate:         .asciz "Date: 3/11/2024"        //Date
    szPrompt:       .asciz "Enter a string: "       //Prompt 
    szFalse:        .asciz "FALSE"
    szTrue:         .asciz "TRUE"
    szS1eq:         .asciz "s1 = "
    szS2eq:         .asciz "s2 = "
    szS3eq:         .asciz "s3 = "
    szS4eq:         .asciz "s4 = "

    szS1:           .skip BUFFER                    //String 1
    szS2:           .skip BUFFER                    //String 2
    szS3:           .skip BUFFER                    //String 3

    szrp:           .asciz "Cot in the hot." 
    szhat:          .asciz "hat."
    szCat:          .asciz "Cat"
    szinHat:        .asciz "in the hat."
    szegg:          .asciz "egg"
    szSpace:        .asciz " "

    szBuffer:       .skip BUFFER                    //Buffer
    dbPtr:          .quad 0                         //Pointer
    dbPtr2:         .quad 0                         //Pointer

    szLen1:         .asciz "s1.length() = " //Length of str1
    szLen2:         .asciz "s2.length() = " //Length of str2
    szLen3:         .asciz "s3.length() = " //Length of str3
    szEquals:       .asciz "String_equals(s1,s3) = "
    szEquals2:      .asciz "String_equals(s1,s1) = "
    szEqIgnore:     .asciz "String_equalsIgnoreCase(s1,s3) = "
    szEqIgnore2:    .asciz "String_equalsIgnoreCase(s1,s2) = "
    szCpy:          .asciz "s4 = String_copy(s1)"
    szSubStr1:      .asciz "String_substring_1(s3,4,14) = "
    szSubStr2:      .asciz "String_substring_2(s3,7) = "
    szCharAt:       .asciz "String_charAt(s2,4) = "
    szStartsWith:   .asciz "String_startsWith_1(s1,11,""hat."") = "
    szStartsWith2:  .asciz "String_startsWith_2(s1,""Cat"") = "
    szEndswith:     .asciz "String_endsWith(s1,""in the hat."") = "
    szindexof1:     .asciz "String_indexOf_1(s2,'g') = "
    szindexof2:     .asciz "String_indexOf_2(s2,'g',9) = "
    szindexof3:     .asciz "String_indexOf_3(s2,""eggs"") = "
    szlastindexof1: .asciz "String_lastIndexOf_1(s2,'g') = "
    szlastindexof2: .asciz "String_lastIndexOf_2(s2,'g',6) = "
    szlastindexof3: .asciz "String_lastIndexOf_3(s2,""egg"") = "
    szreplace:      .asciz "String_replace(s1,'a','o') = "
    sztolower:      .asciz "String_toLowerCase(s1) = "
    sztoupper:      .asciz "String_toUpperCase(s1) = "
    szConcat:       .asciz "String_concat(s1, s2) = "

    chLF:   .byte 0xa   //Hex for line feed
    chBuff: .byte 0x0
    chg:    .byte 0x67
    cha:    .byte 0x61
    cho:    .byte 0x6f
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

    ldr x0,=szPrompt    //Load x0 with the prompt
    bl putstring
    ldr x0,=szS1
    mov x1, BUFFER
    bl getstring

    ldr x0,=szPrompt
    bl putstring
    ldr x0,=szS2
    mov x1, BUFFER
    bl getstring

    ldr x0,=szPrompt
    bl putstring
    ldr x0,=szS3
    mov x1, BUFFER
    bl getstring

    //Test1
    ldr x0,=szS1
    bl String_length
    ldr x1, =szBuffer
    bl int64asc
    ldr x0,=szLen1
    bl putstring
    ldr x0,=szBuffer
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    ldr x0,=szS2
    bl String_length
    ldr x1, =szBuffer
    bl int64asc
    ldr x0,=szLen2
    bl putstring
    ldr x0,=szBuffer
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    ldr x0,=szS3
    bl String_length
    ldr x1, =szBuffer
    bl int64asc
    ldr x0,=szLen3
    bl putstring
    ldr x0,=szBuffer
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 2
    ldr x0,=szS1
    ldr x1,=szS3
    bl String_equals
    mov x1, x0
    cmp x1,0x0
    b.eq main_eq_0
    ldr x0,=szEquals
    bl putstring
    ldr x0,=szTrue
    bl putstring
    b main_eq_next
    main_eq_0:
    ldr x0,=szEquals
    bl putstring
    ldr x0,=szFalse
    bl putstring
    main_eq_next:
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 3
    ldr x0,=szS1
    ldr x1,=szS1
    bl String_equals
    mov x1, x0
    cmp x1,0x0
    b.eq main_eq_0_2
    ldr x0,=szEquals2
    bl putstring
    ldr x0,=szTrue
    bl putstring
    b main_eq_next_2
    main_eq_0_2:
    ldr x0,=szEquals2
    bl putstring
    ldr x0,=szFalse
    bl putstring
    main_eq_next_2:
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 4
    ldr x0,=szS1
    ldr x1,=szS3
    bl String_equalsIgnoreCase
    mov x1, x0
    cmp x1,0x0
    b.eq main_eqig_0
    ldr x0,=szEqIgnore
    bl putstring
    ldr x0,=szTrue
    bl putstring
    b main_eqig_next
    main_eqig_0:
    ldr x0,=szEqIgnore
    bl putstring
    ldr x0,=szFalse
    bl putstring
    main_eqig_next:
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 5
    ldr x0,=szS1
    ldr x1,=szS2
    bl String_equalsIgnoreCase
    mov x1, x0
    cmp x1,0x0
    b.eq main_eqig_0_2
    ldr x0,=szEqIgnore2
    bl putstring
    ldr x0,=szTrue
    bl putstring
    b main_eqig_next_2
    main_eqig_0_2:
    ldr x0,=szEqIgnore2
    bl putstring
    ldr x0,=szFalse
    bl putstring
    main_eqig_next_2:
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 6
    ldr x0,=szCpy
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=szS1eq
    bl putstring
    ldr x0,=szS1
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=szS4eq
    bl putstring
    ldr x0,=szS1
    bl String_copy
    ldr x1,=dbPtr
    str x0,[x1]
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=dbPtr
    ldr x0,[x0]
    bl free
    ldr x1,=dbPtr
    mov x0,0x0
    str x0,[x1]
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 7
    ldr x0,=szSubStr1
    bl putstring
    ldr x0,=szS3
    mov x1, #4
    mov x2, #14
    bl String_substring_1
    ldr x1,=dbPtr
    str x0,[x1]
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=dbPtr
    ldr x0,[x0]
    bl free
    ldr x1,=dbPtr
    mov x0,0x0
    str x0,[x1]
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 8
    ldr x0,=szSubStr2
    bl putstring
    ldr x0,=szS3
    mov x1, #7
    bl String_substring_2
    ldr x1,=dbPtr
    str x0,[x1]
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=dbPtr
    ldr x0,[x0]
    bl free
    ldr x1,=dbPtr
    mov x0,0x0
    str x0,[x1]
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 9
    ldr x0,=szCharAt
    bl putstring
    ldr x0,=szS2
    mov x1, #4
    bl String_charAt
    ldr x1,=chBuff
    strb w0,[x1]
    ldr x0,=chBuff
    bl putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 10
    ldr x0,=szStartsWith
    bl putstring
    ldr x0,=szS1
    ldr x1,=szhat
    mov x2,#11
    bl String_startsWith_1
    mov x1, x0
    cmp x1,0x0
    b.eq main_stwi1_0
    ldr x0,=szTrue
    bl putstring
    b main_stwi1_next
    main_stwi1_0:
    ldr x0,=szFalse
    bl putstring
    main_stwi1_next:
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 11
    ldr x0,=szStartsWith2
    bl putstring
    ldr x0,=szS1
    ldr x1,=szCat
    bl String_startsWith_2
    mov x1, x0
    cmp x1,0x0
    b.eq main_stwi1_0_2
    ldr x0,=szTrue
    bl putstring
    b main_stwi1_next_2
    main_stwi1_0_2:
    ldr x0,=szFalse
    bl putstring
    main_stwi1_next_2:
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 12
    ldr x0,=szEndswith
    bl putstring
    ldr x0,=szS1
    ldr x1,=szinHat
    bl String_endsWith
    mov x1, x0
    cmp x1,0x0
    b.eq main_ewi1_0
    ldr x0,=szTrue
    bl putstring
    b main_ewi1_next
    main_ewi1_0:
    ldr x0,=szFalse
    bl putstring
    main_ewi1_next:
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 13
    ldr x0,=szindexof1
    bl putstring
    ldr x0,=szS2
    ldr x1,=chg
    bl String_indexOf_1
    ldr x1,=szBuffer
    bl int64asc
    ldr x0,=szBuffer
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 14
    ldr x0,=szindexof2
    bl putstring
    ldr x0,=szS2
    ldr x1,=chg
    mov x2,#9
    bl String_indexOf_2
    ldr x1,=szBuffer
    bl int64asc
    ldr x0,=szBuffer
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 15
    ldr x0,=szindexof3
    bl putstring
    ldr x0,=szS2
    ldr x1,=szegg
    bl String_indexOf_3
    ldr x1,=szBuffer
    bl int64asc
    ldr x0,=szBuffer
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 16
    ldr x0,=szlastindexof1
    bl putstring
    ldr x0,=szS2
    ldr x1,=chg
    bl String_lastIndexOf_1
    ldr x1,=szBuffer
    bl int64asc
    ldr x0,=szBuffer
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 17
    ldr x0,=szlastindexof2
    bl putstring
    ldr x0,=szS2
    ldr x1,=chg
    mov x2, #6
    bl String_lastIndexOf_2
    ldr x1,=szBuffer
    bl int64asc
    ldr x0,=szBuffer
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 18
    ldr x0,=szlastindexof3
    bl putstring
    ldr x0,=szS2
    ldr x1,=szegg
    bl String_lastIndexOf_3
    ldr x1,=szBuffer
    bl int64asc
    ldr x0,=szBuffer
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 19
    ldr x0,=szreplace
    bl putstring
    ldr x0,=szS1
    ldr x1,=cha
    ldr x2,=cho
    bl String_replace
    ldr x1,=dbPtr
    str x0,[x1]
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=dbPtr
    ldr x0,[x0]
    bl free
    ldr x1,=dbPtr
    mov x0,0x0
    str x0,[x1]
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 20
    ldr x0,=sztolower
    bl putstring
    ldr x0,=szrp
    bl String_toLowerCase
    ldr x1,=dbPtr
    str x0,[x1]
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=dbPtr
    ldr x0,[x0]
    bl free
    ldr x1,=dbPtr
    mov x0,0x0
    str x0,[x1]
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 21
    ldr x0,=sztoupper
    bl putstring
    ldr x0,=szrp
    bl String_toUpperCase
    ldr x1,=dbPtr
    str x0,[x1]
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=dbPtr
    ldr x0,[x0]
    bl free
    ldr x1,=dbPtr
    mov x0,0x0
    str x0,[x1]
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test22
    ldr x0,=szConcat
    bl putstring
    ldr x0,=szrp
    ldr x1,=szSpace
    bl String_concat
    ldr x1,=dbPtr
    str x0,[x1]

    ldr x0,=dbPtr
    ldr x0,[x0]
    ldr x1,=szS2
    bl String_concat
    ldr x1,=dbPtr2
    str x0,[x1]
    bl putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=dbPtr
    ldr x0,[x0]
    bl free
    ldr x1,=dbPtr
    mov x0,0x0
    str x0,[x1]
    ldr x0,=dbPtr2
    ldr x0,[x0]
    bl free
    ldr x1,=dbPtr2
    mov x0,0x0
    str x0,[x1]
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

	// Setup the parameters to exit the program
	// and then call Linux to do it.
    mov X0, #0 // Use 0 return code
    mov X8, #93 // Service code 93 terminates
    svc 0 // Call Linux to terminate
    
	.end
	.global _start

    .equ BUFFER, 21     //Max buffer length

	.data

    szProgName:     .asciz "Name: Ilyas Zuhuruddin" //Name of programmer
    szClass:        .asciz "Class: CS 3B"           //Class
    szLab:          .asciz "Lab: Rasm 3"            //Lab number
    szDate:         .asciz "Date: 3/11/2024"        //Date
    szPrompt:       .asciz "Enter a string: "       //Prompt 
    szFalse:        .asciz "FALSE"					//False
    szTrue:         .asciz "TRUE"					//True
    szS1eq:         .asciz "s1 = "					//String 1 output
    szS2eq:         .asciz "s2 = "					//String 1 output
    szS3eq:         .asciz "s3 = "					//String 1 output
    szS4eq:         .asciz "s4 = "					//String 1 output

    szS1:           .skip BUFFER                    //String 1
    szS2:           .skip BUFFER                    //String 2
    szS3:           .skip BUFFER                    //String 3

    szrp:           .asciz "Cot in the hot." 		//Copy of sz1 after replace
    szhat:          .asciz "hat."					//hat
    szCat:          .asciz "Cat"					//cat
    szinHat:        .asciz "in the hat."			//in the hat
    szegg:          .asciz "egg"					//egg
    szSpace:        .asciz " "						// 

    szBuffer:       .skip BUFFER                    //Buffer
    dbPtr:          .quad 0                         //Pointer
    dbPtr2:         .quad 0                         //Pointer

    szLen1:         .asciz "s1.length() = " 						//Length of str1
    szLen2:         .asciz "s2.length() = " 						//Length of str2
    szLen3:         .asciz "s3.length() = " 						//Length of str3
    szEquals:       .asciz "String_equals(s1,s3) = "				//Equals string to output
    szEquals2:      .asciz "String_equals(s1,s1) = "				//Equals 2 string to output
    szEqIgnore:     .asciz "String_equalsIgnoreCase(s1,s3) = "		//Equals ignore case string to output
    szEqIgnore2:    .asciz "String_equalsIgnoreCase(s1,s2) = "		//Equals ignore case 2 string to output
    szCpy:          .asciz "s4 = String_copy(s1)"					//Copy string to output
    szSubStr1:      .asciz "String_substring_1(s3,4,14) = "			//Substr1 string to output
    szSubStr2:      .asciz "String_substring_2(s3,7) = "			//Substr2 string to output
    szCharAt:       .asciz "String_charAt(s2,4) = "					//Char at string to output
    szStartsWith:   .asciz "String_startsWith_1(s1,11,""hat."") = "	//Starts with string to output
    szStartsWith2:  .asciz "String_startsWith_2(s1,""Cat"") = "		//Starts with 2 string to output
    szEndswith:     .asciz "String_endsWith(s1,""in the hat."") = "	//Ends with string to output
    szindexof1:     .asciz "String_indexOf_1(s2,'g') = "			//Index of 1 string to output
    szindexof2:     .asciz "String_indexOf_2(s2,'g',9) = "			//Index of 2 string to output
    szindexof3:     .asciz "String_indexOf_3(s2,""eggs"") = "		//Index of 3 string to output
    szlastindexof1: .asciz "String_lastIndexOf_1(s2,'g') = "		//Last index of 1 string to output
    szlastindexof2: .asciz "String_lastIndexOf_2(s2,'g',6) = "		//Last index of 2 string to output
    szlastindexof3: .asciz "String_lastIndexOf_3(s2,""egg"") = "	//Last index of 3 string to output
    szreplace:      .asciz "String_replace(s1,'a','o') = "			//Replace string to output
    sztolower:      .asciz "String_toLowerCase(s1) = "				//Tolower string to output
    sztoupper:      .asciz "String_toUpperCase(s1) = "				//Toupper string to output
    szConcat:       .asciz "String_concat(s1, s2) = "				//Concat string to output

    chLF:   .byte 0xa   //Hex for line feed
    chBuff: .byte 0x0	//Char buffer
    chg:    .byte 0x67	//g
    cha:    .byte 0x61	//a
    cho:    .byte 0x6f	//o
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
    bl putstring		//Branch and link to putstring
    ldr x0,=szS1		//Point x0 to szS1
    mov x1, BUFFER		//Move max size into x1
    bl getstring		//Branch and link to getstring

    ldr x0,=szPrompt	//Load x0 with the prompt
    bl putstring		//Branch and link to putstring
    ldr x0,=szS2		//Point x0 to szS2
    mov x1, BUFFER		//Move max size into x1
    bl getstring		//Branch and link to getstring

    ldr x0,=szPrompt	//Load x0 with the prompt
    bl putstring		//Branch and link to putstring
    ldr x0,=szS3		//Point x0 to szS3
    mov x1, BUFFER		//Move max size into x1
    bl getstring		//Branch and link to getstring

    //Test1
    ldr x0,=szS1		//Point x0 to szS1
    bl String_length	//Branch and link to string length
    ldr x1, =szBuffer	//Point x1 to szBuffer
    bl int64asc			//Branch and linkto in64asc
    ldr x0,=szLen1		//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=szBuffer	//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    ldr x0,=szS2
    bl String_length	//Branch and link to string length
    ldr x1, =szBuffer	//Point x1 to szBuffer
    bl int64asc			//Branch and linkto in64asc
    ldr x0,=szLen2		//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=szBuffer	//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    ldr x0,=szS3		//Point x0 to a variable
    bl String_length	//Branch and link to string length
    ldr x1, =szBuffer	//Point x1 to szBuffer
    bl int64asc			//Branch and linkto in64asc
    ldr x0,=szLen3		//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=szBuffer	//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 2
    ldr x0,=szS1		//Point x0 to szS1
    ldr x1,=szS3		//Point x0 to a variable
    bl String_equals	//Branch
    mov x1, x0			//Move a value into a register
    cmp x1,0x0			//Compare values
    b.eq main_eq_0		//Branch
    ldr x0,=szEquals	//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=szTrue		//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    b main_eq_next		//Branch
    main_eq_0:			//Label to branch to
    ldr x0,=szEquals	//Point x0 to a variable
    bl putstring		//B	ranch and link to putstring
    ldr x0,=szFalse		//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    main_eq_next:		//Label to branch to
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 3
    ldr x0,=szS1		//Point x0 to szS1
    ldr x1,=szS1		//Point x0 to a variable
    bl String_equals	//Branch
    mov x1, x0			//Move a value into a register
    cmp x1,0x0			//Compare values
    b.eq main_eq_0_2	//Branch
    ldr x0,=szEquals2	//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=szTrue		//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    b main_eq_next_2	//Branch
    main_eq_0_2:		//Label to branch to
    ldr x0,=szEquals2	//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=szFalse		//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    main_eq_next_2:		//Label to branch to
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 4
    ldr x0,=szS1		//Point x0 to szS1
    ldr x1,=szS3		//Point x0 to a variable
    bl String_equalsIgnoreCase	//Branch
    mov x1, x0			//Move a value into a register
    cmp x1,0x0			//Compare values
    b.eq main_eqig_0	//Branch
    ldr x0,=szEqIgnore	//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=szTrue		//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    b main_eqig_next	//Branch
    main_eqig_0:		//Label to branch to
    ldr x0,=szEqIgnore	//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=szFalse		//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    main_eqig_next:		//Label to branch to
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 5
    ldr x0,=szS1		//Point x0 to szS1
    ldr x1,=szS2		//Point x0 to a variable
    bl String_equalsIgnoreCase	//Branch
    mov x1, x0			//Move a value into a register
    cmp x1,0x0			//Compare values
    b.eq main_eqig_0_2	//Branch
    ldr x0,=szEqIgnore2	//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=szTrue		//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    b main_eqig_next_2	//Branch
    main_eqig_0_2:		//Label to branch to
    ldr x0,=szEqIgnore2	//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=szFalse		//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    main_eqig_next_2:	//Label to branch to
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 6
    ldr x0,=szCpy		//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=szS1eq		//Point x0 to szS1
    bl putstring		//Branch and link to putstring
    ldr x0,=szS1		//Point x0 to szS1
    bl putstring		//Branch and link to putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=szS4eq		//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=szS1		//Point x0 to szS1
    bl String_copy		//Branch
    ldr x1,=dbPtr		//Point x0 to a variable
    str x0,[x1]			//Store a value into a register
    bl putstring		//Branch and link to putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=dbPtr		//Point x0 to a variable
    ldr x0,[x0]			//Store a value into a register
    bl free				//Branch
    ldr x1,=dbPtr		//Point x0 to a variable
    mov x0,0x0			//Move a value into a register
    str x0,[x1]			//Store a value into a register
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 7
    ldr x0,=szSubStr1	//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=szS3		//Point x0 to a variable
    mov x1, #4			//Move a value into a register
    mov x2, #14			//Move a value into a register
    bl String_substring_1	//Branch
    ldr x1,=dbPtr		//Point x0 to a variable
    str x0,[x1]			//Store a value into a register
    bl putstring		//Branch and link to putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=dbPtr		//Point x0 to a variable
    ldr x0,[x0]			//Store a value into a register
    bl free				//Branch
    ldr x1,=dbPtr		//Point x0 to a variable
    mov x0,0x0			//Move a value into a register
    str x0,[x1]			//Store a value into a register
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 8
    ldr x0,=szSubStr2	//Point x0 to a variable
    bl putstring		//Branch and link to putstring
    ldr x0,=szS3		//Point x0 to a variable
    mov x1, #7			//Move a value into a register
    bl String_substring_2	//Branch
    ldr x1,=dbPtr		//Point x0 to a variable
    str x0,[x1]			//Store a value into a register
    bl putstring		//Branch and link to putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=dbPtr		//Point x0 to a variable
    ldr x0,[x0]			//Move a value into a register
    bl free				//Branch
    ldr x1,=dbPtr		//Point x0 to a variable
    mov x0,0x0			//Move a value into a register
    str x0,[x1]			//Store a value into a register
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 9
    ldr x0,=szCharAt	// load x0 with zsChartAt
    bl putstring	// branch/link putstring
    ldr x0,=szS2	// load x0 with szS2
    mov x1, #4		// move 4 -> x1
    bl String_charAt	// branch/link String_charAt
    ldr x1,=chBuff	// load x1 ->chBuff
    strb w0,[x1]	//store w0 with value of x1
    ldr x0,=chBuff	// load xo with chBuff
    bl putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 10
    ldr x0,=szStartsWith // load x0 with szStartWith
    bl putstring	 // branch/link putstring
    ldr x0,=szS1	 // load x0 with szS1
    ldr x1,=szhat	 // load x1 with szHat
    mov x2,#11		 // move 11 -> x2
    bl String_startsWith_1	// branch/link String_startWith_1
    mov x1, x0		// move x1 with x0 
    cmp x1,0x0		// compare x1 with 0
    b.eq main_stwi1_0	// b.eq main_stwi1_0
    ldr x0,=szTrue	// load x0 with zsTrue
    bl putstring	// branch/link putstring
    b main_stwi1_next	// branch main_stwi1_next
    main_stwi1_0:	// main_stwi1_0
    ldr x0,=szFalse	// load x0 with szFalse
    bl putstring	// branch/link putstring
    main_stwi1_next:	// main_stwi1_next
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 11
    ldr x0,=szStartsWith2 // x0 -> zsStartsWith2
    bl putstring	  // branch/link putstring
    ldr x0,=szS1	  // x0 -> zsS1
    ldr x1,=szCat	  //x1 -> szCat
    bl String_startsWith_2	// branch/link String_startWith_2
    mov x1, x0		 // move x1-+ 0
    cmp x1,0x0		comapre x1 and 0
    b.eq main_stwi1_0_2	// branch of = .to main_stwi1_0_2 
    ldr x0,=szTrue	// x0 -> true
    bl putstring	// branch/link to putstring
    b main_stwi1_next_2 // branch .to main_stwi1_next_2 
    main_stwi1_0_2:	// main_stwi1_0_2
    ldr x0,=szFalse	// x0 -> szFalse
    bl putstring	// branch/link putstring
    main_stwi1_next_2:	// main_stwi1_next_2
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 12
    ldr x0,=szEndswith	// x0 -> szEndswith
    bl putstring	// branch/link to putstring
    ldr x0,=szS1	// x0 -> szS1
    ldr x1,=szinHat	// x1 -> szinHat
    bl String_endsWith	// branch/link String_endsWith
    mov x1, x0		// move x1 -> x0
    cmp x1,0x0		// compare x1 and 0
    b.eq main_ewi1_0	// branch of = .to main_ewi1_0
    ldr x0,=szTrue	// x0 -> sztrue
    bl putstring	// branch/link putstring
    b main_ewi1_next	// branch main_ewi1_next
    main_ewi1_0:	// main_ewi1_0
    ldr x0,=szFalse	// x0 -> zsFalse
    bl putstring	// branch/link putstring
    main_ewi1_next:	// main_ewi1_next
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 13
    ldr x0,=szindexof1	// x0 -> szindexof1
    bl putstring	// branch/link putstring 
    ldr x0,=szS2	// x0 -> szS2
    ldr x1,=chg		// x1 -> chg
    bl String_indexOf_1	// branch/link String_indexOf_1
    ldr x1,=szBuffer	// x1 => szBuffer
    bl int64asc		// branch/link int64asc
    ldr x0,=szBuffer	// x0 -> szBuffer
    bl putstring	// branch/link putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 14
    ldr x0,=szindexof2	// x0 -> szindesof2
    bl putstring	// branch/link putstring
    ldr x0,=szS2	// x0 -> szS2
    ldr x1,=chg		// x1 -> chg
    mov x2,#9		// x2-> 9
    bl String_indexOf_2	// branhc/link string_index_of
    ldr x1,=szBuffer	// x1 -> szBuffer 
    bl int64asc		// branch/link int64asc 
    ldr x0,=szBuffer	// x0 -> szBuffer
    bl putstring	// branch/link putchstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 15
    ldr x0,=szindexof3	// x0 -> szindexof3
    bl putstring	// branch/link putstring
    ldr x0,=szS2	// x0 -> szS2
    ldr x1,=szegg	// x1 -> szegg
    bl String_indexOf_3	// branch/link String_indexOf_3
    ldr x1,=szBuffer	// x1 -> szBuffer
    bl int64asc		// branch/link int64asc
    ldr x0,=szBuffer	// X0 -> SZBuffer
    bl putstring	// branck/link putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 16
    ldr x0,=szlastindexof1	// x0 -> szlastindexof1
    bl putstring		// branch/link putstring
    ldr x0,=szS2		// x0 -> szS2
    ldr x1,=chg			// x1 -> vchg
    bl String_lastIndexOf_1	// branch/link String_lastindexof_1
    ldr x1,=szBuffer		// x1 ->szBuffer
    bl int64asc			// branch/link int64asc
    ldr x0,=szBuffer		// x0 -> szBuffer
    bl putstring		// blranch/link putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 17
    ldr x0,=szlastindexof2	x0 ->to string
    bl putstring		branch -> putstring
    ldr x0,=szS2		// x0 szS2
    ldr x1,=chg			// x1 -> vhg
    mov x2, #6			// x2 -> 6
    bl String_lastIndexOf_2	// branch to fuction 
    ldr x1,=szBuffer		// x1 -> szBuffer
    bl int64asc			// branch top int64asc
    ldr x0,=szBuffer		// x0 -> sZbubber
    bl putstring		// branhc to puchsting
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 18
    ldr x0,=szlastindexof3	// x0 szlastindexof3
    bl putstring		// branch pustring
    ldr x0,=szS2		// x0 szS2
    ldr x1,=szegg		// x1 => sz3gg
    bl String_lastIndexOf_3	// branhc tpo function 
    ldr x1,=szBuffer		// x1 -> buffer
    bl int64asc			// BRANCH TO china
    ldr x0,=szBuffer		// X0 szBuffer
    bl putstring		// branch to putstring
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 19
    ldr x0,=szreplace	// x0 -> string
    bl putstring	// branch to putstring
    ldr x0,=szS1	// x0 -> szS1
    ldr x1,=cha		// x1 -> cha
    ldr x2,=cho		// x2 cho
    bl String_replace	// branch to functiopn 
    ldr x1,=dbPtr	// x1 ->dbPtr
    str x0,[x1]		// store x0 -> x1
    bl putstring	// branch putstrinbg
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=dbPtr	// im in your eyes
    ldr x0,[x0]		// x0 -> x0 
    bl free		// branch to free
    ldr x1,=dbPtr	// x1-> dbPtr
    mov x0,0x0		// move x0 with 0
    str x0,[x1]		// store x0 with x1
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 20
    ldr x0,=sztolower	//Point x0 to a variable
    bl putstring		//Branch
    ldr x0,=szrp		//Point x0 to a variable
    bl String_toLowerCase	//Branch
    ldr x1,=dbPtr		//Point x0 to a variable
    str x0,[x1]			//Store a value in a register
    bl putstring		//Branch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=dbPtr		//Point x0 to a variable
    ldr x0,[x0]			//Store a value in a register
    bl free				//Branch
    ldr x1,=dbPtr		//Point x0 to a variable
    mov x0,0x0
    str x0,[x1]			//Store a value in a register
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test 21
    ldr x0,=sztoupper	//Point x0 to a variable
    bl putstring		//Branch
    ldr x0,=szrp		//Point x0 to a variable
    bl String_toUpperCase	//Branch
    ldr x1,=dbPtr		//Point x0 to a variable
    str x0,[x1]			//Store a value in a register
    bl putstring		//Branch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=dbPtr		//Point x0 to a variable
    ldr x0,[x0]			//Store a value in a register
    bl free				//Branch
    ldr x1,=dbPtr		//Point x0 to a variable
    mov x0,0x0			//Move a value into a register
    str x0,[x1]			//Store a value in a register
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

    //Test22
    ldr x0,=szConcat	//Point x0 to a variable
    bl putstring		//Branch
    ldr x0,=szrp		//Point x0 to a variable
    ldr x1,=szSpace		//Point x0 to a variable
    bl String_concat	//Branch
    ldr x1,=dbPtr		//Point x0 to a variable
    str x0,[x1]			//Store a value in a register

    ldr x0,=dbPtr		//Point x0 to a variable
    ldr x0,[x0]			//Store a value in a register
    ldr x1,=szS2		//Point x0 to a variable
    bl String_concat	//Branch
    ldr x1,=dbPtr2		//Point x0 to a variable
    str x0,[x1]			//Store a value in a register
    bl putstring		//Branch
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch
    ldr x0,=dbPtr		//Point x0 to a variable
    ldr x0,[x0]			//Store a value in a register
    bl free				//Branch
    ldr x1,=dbPtr		//Point x0 to a variable
    mov x0,0x0			//Move a value into a register
    str x0,[x1]			//Store a value in a register
    ldr x0,=dbPtr2		//Point x0 to a variable
    ldr x0,[x0]			//Store a value in a register
    bl free				//Branch
    ldr x1,=dbPtr2		//Point x0 to a variable
    mov x0,0x0			//Move a value into a register
    str x0,[x1]			//Store a value in a register
    ldr x0,=chLF        //Load x0 with the address of chLF
    bl putch            //Branch and link to putch

	// Setup the parameters to exit the program
	// and then call Linux to do it.
    mov X0, #0 // Use 0 return code
    mov X8, #93 // Service code 93 terminates
    svc 0 // Call Linux to terminate
    
	.end

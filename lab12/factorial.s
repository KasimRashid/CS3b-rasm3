    .global factorial
    .data
    .text
factorial:

    //Push AAPCS required registers
    str x19, [sp, #-16]!   //n, n - 1
    str x30, [sp, #-16]!   //n, n - 1

    cmp x0, 0x0         //Compare for base case
    b.eq fact_baseCase  //If equal, branch to base case
    mov x19, x0         //Save n in x19
    sub x0, x19, #1    //Subtract 1
    bl factorial        //fact(n - 1)
    mul x0, x0, x19     //n * fact(n - 1)

    b fact_ret          //Return

    fact_baseCase:
    mov x0, #1          //Move 1 into x0 for base case

    fact_ret:
    //Pop AAPCS required registers
    ldr x30, [sp], #16 //Pop x19 and x20
    ldr x19, [sp], #16 //Pop x19 and x20

    ret lr                  //Return
.end

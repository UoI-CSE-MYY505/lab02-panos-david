.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1

prog:
    li s0, 0         # Initialize s0 to 0
    beq a1, x0, done # If the array length is 0, jump to done

    mv t0, a0        # t0 will point to the curr ent array element
    mv t1, a1        # t1 will be our loop counter

loop_start:
    lw t2, 0(t0)     # Load the current array element into t2
    beq t2, a2, match # If t2 equals the search value, go to match

no_match:
    addi t0, t0, 4    # Move to the next array element
    addi t1, t1, -1   # Decre ment the counter
    bnez t1, loop_start # If t1 is not 0, continue looping
    j done            # Exit loop

match:
    mv s0, t0        # Store the address of the matched element in s0
    j no_match       # Continue to the next element

done:
    addi a7, zero, 10 
    ecall

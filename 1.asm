        global main
	extern printf

        section .text
main:   
	;; fib 0
	mov r15, 0              ; sum so far
        mov r14, 1              ; number being tested
        call all
	
        mov rdi, message
        mov rsi, r15
        mov rax, 0
        call printf

        ret

all:        ; loop from 1 to 1000
	cmp r14, 1000
        jge done2

        nop
        mov rsi, r14
        call check
        test rax, rax
        jz add
        jnz skip

add:
        add r15, r14
        mov r13, 1
        add r14, r13
        call all

skip:
        inc r14
        call all


done2:   ret

check:  ; check if a number is divisible by 3 or 5
        mov rdx, 0
        mov rax, rsi              ; big number
        mov rbx, 3                ; divisor being tested
        div rbx
        jmp gratuitous

gratuitous: 
        cmp rdx, 0
        jz done

        mov rdx, 0
        mov rax, rsi              ; big number
        mov rbx, 5                ; divisor being tested
        div rbx

        cmp rdx, 0
        jz done

        jmp fail
        
done:   mov rax, 0
        ret
	
fail:   mov rax, 1
        ret

message:
        db "Output = %d", 10, 0

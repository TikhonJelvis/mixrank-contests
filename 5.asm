        global main
	extern printf

        section .text
main:   
	;; fib 0
        mov rsi, 19399380
        mov rdi, 20
        call all
	
        mov rdi, message
        mov rsi, rax
        mov rax, 0
        call printf

        ret

all:    mov rdi, 20
        call check
        cmp rax, 0
        jz success
        add rsi, 19399380
        jmp all

success:
        mov rax, rsi
        ret

check:  test rdi, rdi
        jz done

        mov rdx, 0
        mov rax, rsi            ; big number
        mov rbx, rdi            ; divisor being tested
        div rbx

        cmp rdx, 0
        jnz fail
	
        dec rdi
        jmp check
        
	
done:   mov rax, 0
        ret
	
fail:   mov rax, 1
        ret

message:
        db "Output = %d", 10, 0

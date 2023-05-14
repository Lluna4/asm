.global _start
.intel_syntax noprefix

_start:
    mov rax, 0
    mov rdi, 0    
    mov rdx, 20
    lea rsi, [input]
    syscall

    mov rax, 1
    mov rdi, 1
    mov rdx, 14
    lea rsi, [input]
    syscall
    
    mov rax, 60
    mov rdi, 0
    syscall

input:
    .skip 20
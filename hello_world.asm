.global _start
.intel_syntax noprefix

_start:

    mov rax, 1
    mov rdi, 1
    mov rdx, 14
    lea rsi, [hello_world]
    syscall

    //sys_exit
    mov rax, 60
    mov rdi, 0
    syscall


hello_world:
    .asciz "Hello world!\n"
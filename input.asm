.intel_syntax noprefix

.section .bss    
input_buffer:
    .skip 20

num_buffer:
    .skip 4

.section .text
.globl _start
_start:
    mov rax, 1
    mov rdi, 1
    mov rdx, 111
    lea rsi, [inicio]
    syscall

    mov rax, 0
    mov rdi, 0
    mov rdx, 1
    lea rsi, [input_buffer]
    syscall

    mov rcx, 1
    lea rdi, [one]
    lea rsi, [input_buffer]
    repe cmpsb
    je  uno

    mov rax, 60
    xor rdi, rdi
    syscall

uno:
    mov rax, 1
    mov rdi, 1
    mov rdx, 68
    lea rsi, [unos]
    syscall

    mov rax, 0
    mov rdi, 0
    mov rdx, 1
    lea rsi, [num_buffer]
    syscall

    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    lea rsi, [num_buffer]
    syscall

    mov rax, 1
    mov rdi, 1
    mov rdx, 4
    lea rsi, [son]
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall

inicio:
    .asciz "Hola! Este es un conversor de divisas\nDime si quieres cambiar de euros a dolares (1) o de dolares a euros (2)\n"

unos:
    .asciz "Has elegido cambiar de euros a dolares, dime cuantos euros tienes: "

son:
    .asciz "€ son"

dolar:
    .asciz "$"

one:
    .asciz "1"


.intel_syntax noprefix

.section .bss    
input_buffer:
    .skip 20

.section .text
.globl _start
_start:

    // Print a message to prompt the user for input
    mov rax, 1
    mov rdi, 1
    mov rdx, 111
    lea rsi, [inicio]
    syscall

    // Read input from the user into the input buffer
    mov rax, 0
    mov rdi, 0
    mov rdx, 256
    lea rsi, [input_buffer]
    syscall

    // Compare the input with the string "1"
    mov rcx, 2
    lea rdi, [one]
    lea rsi, [input_buffer]
    repe cmpsb
    je  uno

    // Exit the program with a status of 0
    mov rax, 60
    xor rdi, rdi
    syscall

uno:
    // Print a message to prompt the user for more input
    mov rax, 1
    mov rdi, 1
    mov rdx, 68
    lea rsi, [unos]
    syscall

    // Read more input from the user into the input buffer
    mov rax, 0
    mov rdi, 0    
    mov rdx, 256
    lea rsi, [input_buffer]
    syscall

    // Exit the program with a status of 0
    mov rax, 60
    xor rdi, rdi
    syscall

inicio:
    .asciz "Hola! Este es un conversor de divisas\nDime si quieres cambiar de euros a dolares (1) o de dolares a euros (2)\n"

unos:
    .asciz "Has elegido cambiar de euros a dolares, dime cuantos euros tienes: "

one:
    .asciz "1"


; Official cheat sheet 
; strict copyright under penalty of litigation 
; and resulting death penalty - Jarlus Leopoldus Moe, Esq.

; also Ollie

global main         ; oh global main I ca-
section .text       ; right
main:               ; labels? What is this fortran

mov rax, 1          ; huh
mov rdi, 1          ; wat
mov rsi, msg        ; que
mov rdx, len        ; like
syscall             ; ok
mov rax, 60         ; well
xor rdi, rdi        ; I don't-
syscall             ; hmm

section .data       ; so
msg db "Hello World!", 0xa  ; waith I'm not finished
len equ $ - msg             ; argh

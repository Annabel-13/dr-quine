; A comment
%define S "; A comment%1$c%%define S %2$c%3$s%2$c%1$c%%define F %2$cGrace_kid.s%2$c%1$c%%define G() extern fopen, fprintf, fclose%1$c%%macro MAIN 0%1$cglobal main%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    sub rsp, 16%1$c    lea rdi, [rel filename]%1$c    lea rsi, [rel mode]%1$c    call fopen%1$c    mov [rsp], rax%1$c    mov rdi, rax%1$c    lea rsi, [rel fmt]%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    lea r8, [rel fmt]%1$c    call fprintf%1$c    mov rdi, [rsp]%1$c    call fclose%1$c    xor eax, eax%1$c    add rsp, 16%1$c    pop rbp%1$c    ret%1$c%%endmacro%1$csection .data%1$c    fmt db S, 0%1$c    filename db F, 0%1$c    mode db %2$cw%2$c, 0%1$csection .text%1$cG()%1$cMAIN%1$c"
%define F "Grace_kid.s"
%define G() extern fopen, fprintf, fclose
%macro MAIN 0
global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    lea rdi, [rel filename]
    lea rsi, [rel mode]
    call fopen
    mov [rsp], rax
    mov rdi, rax
    lea rsi, [rel fmt]
    mov rdx, 10
    mov rcx, 34
    lea r8, [rel fmt]
    call fprintf
    mov rdi, [rsp]
    call fclose
    xor eax, eax
    add rsp, 16
    pop rbp
    ret
%endmacro
section .data
    fmt db S, 0
    filename db F, 0
    mode db "w", 0
section .text
G()
MAIN

section .note.GNU-stack noalloc noexec nowrite progbits

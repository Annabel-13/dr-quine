%define I 5
%define S "%%define I %4$d%1$c%%define S %2$c%3$s%2$c%1$c%%define X() extern sprintf, fopen, fprintf, fclose, system%1$c%%macro MAIN 0%1$cglobal main%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    mov eax, [rel i]%1$c    cmp eax, 0%1$c    jl .end%1$c    lea rdi, [rel buffer]%1$c    lea rsi, [rel filename]%1$c    mov edx, eax%1$c    call sprintf%1$c    lea rdi, [rel buffer]%1$c    lea rsi, [rel mode]%1$c    call fopen%1$c    test rax, rax%1$c    jz .end%1$c    mov r12, rax%1$c    mov rdi, r12%1$c    lea rsi, [rel fmt]%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    lea r8, [rel fmt]%1$c    mov eax, [rel i]%1$c    dec eax%1$c    mov r9d, eax%1$c    call fprintf%1$c    mov rdi, r12%1$c    call fclose%1$c    mov eax, [rel i]%1$c    test eax, eax%1$c    jle .end%1$c    lea rdi, [rel buffer]%1$c    lea rsi, [rel compile]%1$c    mov edx, eax%1$c    mov ecx, eax%1$c    mov r8d, eax%1$c    mov r9d, eax%1$c    call sprintf%1$c    lea rdi, [rel buffer]%1$c    call system%1$c.end:%1$c    xor eax, eax%1$c    pop rbp%1$c    ret%1$c%%endmacro%1$csection .data%1$c    i dd I%1$c    fmt db S, 0%1$c    filename db %2$cSully_%%d.s%2$c, 0%1$c    compile db %2$cnasm -f elf64 Sully_%%d.s && gcc -no-pie Sully_%%d.o -o Sully_%%d && ./Sully_%%d%2$c, 0%1$c    mode db %2$cw%2$c, 0%1$csection .bss%1$c    buffer resb 256%1$csection .text%1$cX()%1$cMAIN%1$c"
%define X() extern sprintf, fopen, fprintf, fclose, system
%macro MAIN 0
global main
main:
    push rbp
    mov rbp, rsp
    mov eax, [rel i]
    cmp eax, 0
    jl .end
    lea rdi, [rel buffer]
    lea rsi, [rel filename]
    mov edx, eax
    call sprintf
    lea rdi, [rel buffer]
    lea rsi, [rel mode]
    call fopen
    test rax, rax
    jz .end
    mov r12, rax
    mov rdi, r12
    lea rsi, [rel fmt]
    mov rdx, 10
    mov rcx, 34
    lea r8, [rel fmt]
    mov eax, [rel i]
    dec eax
    mov r9d, eax
    call fprintf
    mov rdi, r12
    call fclose
    mov eax, [rel i]
    test eax, eax
    jle .end
    lea rdi, [rel buffer]
    lea rsi, [rel compile]
    mov edx, eax
    mov ecx, eax
    mov r8d, eax
    mov r9d, eax
    call sprintf
    lea rdi, [rel buffer]
    call system
.end:
    xor eax, eax
    pop rbp
    ret
%endmacro
section .data
    i dd I
    fmt db S, 0
    filename db "Sully_%d.s", 0
    compile db "nasm -f elf64 Sully_%d.s && gcc -no-pie Sully_%d.o -o Sully_%d && ./Sully_%d", 0
    mode db "w", 0
section .bss
    buffer resb 256
section .text
X()
MAIN

section .note.GNU-stack noalloc noexec nowrite progbits

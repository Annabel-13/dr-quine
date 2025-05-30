; Outside comment

global main
extern printf

section .rodata
code_str db "; Outside comment%1$c%1$cglobal main%1$cextern printf%1$c%1$csection .rodata%1$ccode_str db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$cmain:%1$c    enter 0, 0%1$c    lea rdi, [rel code_str]%1$c    ; Inside comment%1$c    mov rsi, 10%1$c    mov rdx, 34%1$c    lea rcx, [rel code_str]%1$c    call printf%1$c    leave%1$c    call return%1$c%1$creturn:%1$c    ret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c", 0

section .text
main:
    enter 0, 0
    lea rdi, [rel code_str]
    ; Inside comment
    mov rsi, 10
    mov rdx, 34
    lea rcx, [rel code_str]
    call printf
    leave
    call return

return:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits

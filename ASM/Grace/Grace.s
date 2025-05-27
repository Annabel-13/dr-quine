; Only one comment

%define OPEN_CALL_NB 2        ; SYS_OPEN (Linux)
%define CLOSE_CALL_NB 3       ; SYS_CLOSE (Linux)
%define O_RDWR 2              ; O_RDWR flag
%define O_CREAT 64            ; O_CREAT flag
%define PERMISSIONS 420       ; 0644 in octal (rw-r--r--)

global main
extern printf

section .rodata
output db "Grace_kid.s", 0
code_str db "; Only one comment%1$c%%define OPEN_CALL_NB 2%1$c%%define CLOSE_CALL_NB 3%1$c%%define O_RDWR 2%1$c%%define O_CREAT 64%1$c%%define PERMISSIONS 420%1$c%1$cglobal main%1$cextern printf%1$c%1$csection .rodata%1$coutput db %2$cGrace_kid.s%2$c, 0%1$ccode_str db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c%1$cmain:%1$center 0, 0%1$cmov rax, OPEN_CALL_NB%1$clea rdi, [rel output]%1$cmov rsi, O_RDWR | O_CREAT%1$cmov rdx, PERMISSIONS%1$csyscall%1$cmov rdi, rax%1$clea rsi, [rel code_str]%1$ccall printf%1$cmov rax, CLOSE_CALL_NB%1$cmov rdi, rdi%1$csyscall%1$cleave%1$cret%1$c", 0

section .text

main:
    enter 0, 0
    ; open("Grace_kid.s", O_RDWR | O_CREAT, 0644)
    mov rax, OPEN_CALL_NB
    lea rdi, [rel output]
    mov rsi, O_RDWR | O_CREAT
    mov rdx, PERMISSIONS
    syscall

    ; call printf(code_str)
    lea rdi, [rel code_str]
    call printf

    ; close(fd)
    mov rax, CLOSE_CALL_NB
    mov rdi, rax
    syscall

    leave
    ret

section .note.GNU-stack noalloc noexec nowrite progbits

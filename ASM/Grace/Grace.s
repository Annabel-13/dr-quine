; Grace
%define S "; Grace%1$c%%define S %2$c%3$s%2$c%1$c%%define F %2$cGrace_kid.s%2$c%1$c%%define M global main%1$cmain:%1$c push rbp%1$c mov rbp, rsp%1$c sub rsp, 4112%1$c mov rax, 2%1$c lea rdi, [rel f]%1$c mov rsi, 577%1$c mov rdx, 420o%1$c syscall%1$c mov r12, rax%1$c lea rdi, [rsp]%1$c lea rsi, [rel s]%1$c mov rdx, 10%1$c mov rcx, 34%1$c lea r8, [rel s]%1$c call sprintf wrt ..plt%1$c mov rdx, rax%1$c mov rax, 1%1$c mov rdi, r12%1$c lea rsi, [rsp]%1$c syscall%1$c mov rax, 3%1$c mov rdi, r12%1$c syscall%1$c xor eax, eax%1$c add rsp, 4112%1$c pop rbp%1$c ret%1$csection .data%1$c s db S, 0%1$c f db F, 0%1$csection .text%1$cextern sprintf%1$cM%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c"
%define F "Grace_kid.s"
%define M global main
main:
 push rbp
 mov rbp, rsp
 sub rsp, 4112
 mov rax, 2
 lea rdi, [rel f]
 mov rsi, 577
 mov rdx, 420o
 syscall
 mov r12, rax
 lea rdi, [rsp]
 lea rsi, [rel s]
 mov rdx, 10
 mov rcx, 34
 lea r8, [rel s]
 call sprintf wrt ..plt
 mov rdx, rax
 mov rax, 1
 mov rdi, r12
 lea rsi, [rsp]
 syscall
 mov rax, 3
 mov rdi, r12
 syscall
 xor eax, eax
 add rsp, 4112
 pop rbp
 ret
section .data
 s db S, 0
 f db F, 0
section .text
extern sprintf
M
section .note.GNU-stack noalloc noexec nowrite progbits

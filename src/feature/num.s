.global num

.data
msg_error_tonum: .ascii "Error: tonum error\n"
msg_error_tonum_length=.-msg_error_tonum

.text
num:
    movq %rbp, %r15
    movq %rsp, %rbp

    pushq %r9
    pushq %r10
    call write

    pushq %r13
    pushq %r14
    call read

    pushq %r13
    pushq %rax # Количество введенных символов
    pushq $10 # Основание системы счисления
    call tonum

    cmpq $0, %r14
    jne input_num_end_with_error

    movq %rbp, %rsp
    movq %r15, %rbp

    ret

input_num_end_with_error:
    pushq $msg_error_tonum
    pushq $msg_error_tonum_length
    call write
    movq %rbp, %rsp
    jmp exit

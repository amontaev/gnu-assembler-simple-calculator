.global num

.data
msg_error_tonum: .ascii "Error: tonum error\n"
msg_error_tonum_length=.-msg_error_tonum

.text
num:
    pushq %rbp
    movq %rsp, %rbp

    movq %r9, %rsi
    movq %r10, %rdx
    call write

    movq %r13, %rsi
    movq %r14, %rdx
    call read

    pushq %r13
    pushq %rax # Количество введенных символов
    pushq $10 # Основание системы счисления
    call tonum

    cmpq $0, %r14
    jne error_input_num

    jmp num_end
error_input_num:
    movq $msg_error_tonum, %rsi
    movq $msg_error_tonum_length, %rdx
    call write
num_end:
    leave
    ret

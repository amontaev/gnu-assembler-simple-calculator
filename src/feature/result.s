.global result

.data
msg_error_operation: .ascii "Error: Unknown operation\n"
msg_error_operation_length=.-msg_error_operation

.text
result:
    pushq %rbp
    movq %rsp, %rbp

    call calculate
    cmpq $0, %r14
    jne error_operation
    
    // Преобразование результата в строку

    subq $1, %rsp
    movb $10, 0(%rsp)

    movq $10, %rbx
    movq $1, %rcx

    cmpq $47, %r12
    jne whole_part

    movq %rax, %r14 # Временно сохраняем значение %rax в %r14
    movq %rdx, %rax
    movq $point, %rdi
    jmp tostr

point:
    subq $1, %rsp
    movb $46, 0(%rsp)
    addq $1, %rcx

    movq %r14, %rax
    movq $0, %r14
whole_part:
    movq $result_str, %rdi
    jmp tostr
result_str:
    subq $1, %rsp
    movb $61, 0(%rsp)

    subq $1, %rsp
    movb $116, 0(%rsp)

    subq $1, %rsp
    movb $108, 0(%rsp)

    subq $1, %rsp
    movb $117, 0(%rsp)

    subq $1, %rsp
    movb $115, 0(%rsp)

    subq $1, %rsp
    movb $101, 0(%rsp)

    subq $1, %rsp
    movb $114, 0(%rsp)

    addq $7, %rcx

    // Вывод результата
    movq %rsp, %rsi
    movq %rcx, %rdx
    call write
    jmp result_end
error_operation:
    movq $msg_error_operation, %rsi
    movq $msg_error_operation_length, %rdx
    call write
result_end:
    leave
    ret

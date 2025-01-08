.global operation

.data
operation_str: .ascii "operation (+-*/): "
operation_str_length=.-operation_str

operation_str_input: .fill 2, 1, 0
operation_str_input_length=.-operation_str_input

.text
operation:
    movq $operation_str, %rsi
    movq $operation_str_length, %rdx
    call write

    movq $operation_str_input, %rsi
    movq $operation_str_input_length, %rdx
    call read
    movq $0, %rax
    movb 0(%rsi), %al
    movq %rax, %r12

    ret

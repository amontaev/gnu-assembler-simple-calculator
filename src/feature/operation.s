.global operation

.data
operation_str: .ascii "operation (+-*/): "
operation_str_length=.-operation_str

operation_str_input: .fill 2, 1, 0
operation_str_input_length=.-operation_str_input

.text
operation:
    movq %rbp, %r15
    movq %rsp, %rbp

    pushq $operation_str
    pushq $operation_str_length
    call write

    pushq $operation_str_input
    pushq $operation_str_input_length
    call read
    movq $0, %rax
    movb 0(%rsi), %al
    movq %rax, %r12
    
    movq %rbp, %rsp
    movq %r15, %rbp

    ret

.global _start

.data
first_number_str: .ascii "num1: "
first_number_str_length=.-first_number_str

first_number_input: .fill 10, 1, 0
first_number_input_length=.-first_number_input

second_number_str: .ascii "num2: "
second_number_str_length=.-second_number_str

second_number_input: .fill 10, 1, 0
second_number_input_length=.-second_number_input

.text
_start:
    movq %rsp, %rbp
step_num1:
    movq $first_number_str, %r9
    movq $first_number_str_length, %r10
    movq $first_number_input, %r13
    movq $first_number_input_length, %r14
    call num
    movq %rdi, %r10
    movq %rbp, %rsp
step_operation:
    call operation
    movq %rbp, %rsp
step_num2:
    movq $second_number_str, %r9

    pushq %r10
    movq $second_number_str_length, %r10

    movq $second_number_input, %r13
    movq $second_number_input_length, %r14
    call num

    popq %r10
    movq %rdi, %r13
    movq %rbp, %rsp
step_calculate:
    call result
    movq %rbp, %rsp
end:
    jmp exit

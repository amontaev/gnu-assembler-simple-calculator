.global tostr

.text
# Функция преобразовывает числовое значение в строку ascii символов
# Параметр:
# %rax - число котороу нужно преобразовать в строку
# %rbx - основание системы счисления
# %rsp - адрес левой границы стека
# %rcx - начальное значение счетчика
# %rdi - адрес возврата
tostr:
    movq %rax, %r15 # Необходимо сохранить т.к. в ходе преобразования %rax будет обнулен
    cmpq $0, %rax
    jge tostr_loop
    negq %rax # Инверсия значения в %rax
tostr_loop:
    movq $0, %rdx
    div %rbx
    addb $48, %dl
    subq $1, %rsp
    movb %dl, 0(%rsp)
    addq $1, %rcx
    cmpq $0, %rax
    je check_sign
    jmp tostr_loop
check_sign:
    cmpq $0, %r15 # Проверяем раннее сохраненное значение %rax
    jge end_tostr
    subq $1, %rsp
    movb $45, 0(%rsp) # Добавляем знак "-" если исходное значение %rax меньше нуля
    addq $1, %rcx
end_tostr:
    jmp *%rdi

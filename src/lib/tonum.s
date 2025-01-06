.global tonum

.text
# Функция преобразовывает введенный текст из ascii символов в число
# Параметр:
# %rsi - адрес начала строки
# %rbx - основание системы счисления
# %r9 - адрес конца строки
tonum:
    movq 24(%rsp), %rsi

    movq %rsi, %r9
    addq 16(%rsp), %r9
    subq $2, %r9

    movq 8(%rsp), %rbx

    movq $1, %rcx
    movq $0, %rdi # запись результата

    movq $0, %r14

    cmpb $45, 0(%rsi) # Проверка первого символа на знак "-"
    jne tonum_start_loop
    addq $1, %rsi # Если первый знак "-" %r9 будет указывать на адрес первого числа
    movq $1, %r13 # Сохраняем отметку что число отрицательное. Необходимо т.к. %r9 больше не указывает на начало строки
tonum_start_loop:
    movq $0, %rax
    movb 0(%r9), %al

    // Проверка была ли введена буква
    cmpq $48, %rax
    jb set_error
    cmpq $57, %rax
    jg set_error

    subq $48, %rax # Преобразование в число. Смещение согласно таблице ascii
    mul %rcx
    addq %rax, %rdi
    subq $1, %r9
    cmpq %rsi, %r9
    jb check_sign
    movq %rcx, %rax
    mul %rbx
    movq %rax, %rcx
    jmp tonum_start_loop
check_sign:
    cmpq $1, %r13
    jne tonum_end
    negq %rdi
    jmp tonum_end
set_error:
    movq $1, %r14
tonum_end:
    ret

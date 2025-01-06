.global calculate

.text
# Функция 
# Параметр:
# %r12 - символ операции
# %r14 - ошибка при вводе операции
# %rax - результат операции
calculate:
    movq $0, %r14 # Обнулить ошибку
    movq %r10, %rax

    cmpq $43, %r12 # Код символа "+" в соответствии с таблицей ascii равен 43
    je add

    cmpq $45, %r12 # Код символа "-" в соответствии с таблицей ascii равен 45
    je sub

    cmpq $42, %r12 # Код символа "*" в соответствии с таблицей ascii равен 42
    je mul

    cmpq $47, %r12 # Код символа "/" в соответствии с таблицей ascii равен 47
    je check_sign_for_div

    movq $1, %r14
    ret
add:
    addq %r13, %rax
    ret
sub:
    subq %r13, %rax
    ret
mul:
    imul %r13
    ret
check_sign_for_div:
    movq $0, %rdx
    cmpq $0, %rax
    jge div
    notq %rdx # Необходимо т.к. в случае деления со знаком %rdx должен быть заполнен единицами
div:
    idiv %r13
    ret

.global read

.text
# Ввод текста в консоль через системный вызов sys_read
# Параметр:
# %rsi - адрес сохранения строки
# %rdx - максимальное количество символов
read:
    movq $0, %rax
    movq $1, %rdi
    syscall
    ret

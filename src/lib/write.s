.global write

.text
# Функция выводит текст в консоль через системный вызов sys_write
# Параметр:
# %rsi - адрес начала строки
# %rdx - количество символов для вывода
write:
    movq $1, %rax
    movq $1, %rdi
    movq 16(%rsp), %rsi
    movq 8(%rsp), %rdx
    syscall
    ret

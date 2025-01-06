.global exit

.text
# Функция завершает работу программы через системный вызов sys_exit
exit:
    movq $60, %rax
    movq $0, %rdi
    syscall

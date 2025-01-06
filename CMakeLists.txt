cmake_minimum_required(VERSION 3.31)

project(gnu-assembler-simple-calculator LANGUAGES ASM-ATT)

add_executable(app.exe
    ./src/core/calculate.s
    ./src/lib/exit.s
    ./src/lib/read.s
    ./src/lib/write.s
    ./src/lib/tonum.s
    ./src/lib/tostr.s
    ./src/feature/num.s
    ./src/feature/operation.s
    ./src/feature/result.s
    ./src/app.s
)

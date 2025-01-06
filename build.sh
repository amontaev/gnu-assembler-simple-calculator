rm -r build
mkdir build
cd build

as ../src/core/calculate.s -o calculate.o
as ../src/lib/exit.s -o exit.o
as ../src/lib/read.s -o read.o
as ../src/lib/write.s -o write.o
as ../src/lib/tonum.s -o tonum.o
as ../src/lib/tostr.s -o tostr.o
as ../src/feature/num.s -o num.o
as ../src/feature/operation.s -o operation.o
as ../src/feature/result.s -o result.o

ar r lib.a calculate.o
ar r lib.a exit.o
ar r lib.a read.o
ar r lib.a write.o
ar r lib.a tonum.o
ar r lib.a tostr.o
ar r lib.a num.o
ar r lib.a operation.o
ar r lib.a result.o

rm -r calculate.o
rm -r exit.o
rm -r read.o
rm -r write.o
rm -r tonum.o
rm -r tostr.o
rm -r num.o
rm -r operation.o
rm -r result.o

as ../src/app.s -o app.o

ld app.o -o ./app.exe -L . lib.a

rm -r app.o
rm -r lib.a

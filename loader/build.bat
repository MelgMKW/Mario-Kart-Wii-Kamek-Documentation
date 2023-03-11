@echo off
SETLOCAL EnableDelayedExpansion
cls
:: Compile CPP
echo "Compiling cpps..."
..\cw\mwcceppc.exe -i . -I- -i libraries -Cpp_exceptions off -enum int -RTTI off -once -O4,s -use_lmw_stmw on -fp fmadd -rostr -sdata 0 -sdata2 0 -c -o  mkw.o mkw.cpp
..\cw\mwcceppc.exe -i . -I- -i ../k_stdlib -Cpp_exceptions off -enum int -RTTI off -once -O4,s -use_lmw_stmw on -fp fmadd -rostr -sdata 0 -sdata2 0 -c -o kamekLoader.o kamekLoader.cpp

:: Link
echo Linking...
..\Kamek\bin\Debug\Kamek mkw.o kamekLoader.o -static=0x80004000 -output-code=Loader.bin
del *.o >NUL
ENDLOCAL
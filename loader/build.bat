@echo off
SETLOCAL EnableDelayedExpansion

cls

:: CPP compilation settings
SET CC="../cw/mwcceppc.exe"
SET CFLAGS=-I- -i %cd% -i "../source" -i "../source/game" -i "../engine" -gcc_extensions on -Cpp_exceptions off -enum int -O4,s -use_lmw_stmw on -fp hard -rostr -sdata 0 -sdata2 0 -maxerrors 1 -func_align 4 -rtti off
SET DEFINE=

::: CPP Sources
%CC% %CFLAGS% -c -o "build/mkw.o" "mkw.cpp"
%CC% %CFLAGS% -c -o "build/kamek.o" "kamekLoader.cpp"

:: Link
echo Linking...
"../KamekSource/bin/Debug/Kamek" "build/mkw.o" "build/kamek.o" -static=0x80004000 -output-code=Loader.bin

if %ErrorLevel% equ 0 (
	del build\*.o
)

:end
ENDLOCAL
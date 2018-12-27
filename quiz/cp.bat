@echo off

cls

echo COMPILING......

ml /c /Zd /coff %1.asm

if %ERRORLEVEL% EQU 0 (
	
	\masm32\bin\Link /SUBSYSTEM:CONSOLE %1.obj
	echo FINISH
	%1.exe
)



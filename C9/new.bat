@echo off

type Template > %1.asm
echo %1 Created
start %1.asm
%1.asm
exit
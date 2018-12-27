@echo off

cls

md %1

copy "C:\Users\lpc05\Desktop\assembly\Template" "C:\Users\lpc05\Desktop\assembly\%1\Template" 
copy "C:\Users\lpc05\Desktop\assembly\new.bat" "C:\Users\lpc05\Desktop\assembly\%1\new.bat"
copy "C:\Users\lpc05\Desktop\assembly\cp.bat" "C:\Users\lpc05\Desktop\assembly\%1\cp.bat"

echo FINISH
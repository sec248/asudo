@echo off
if "%1" equ "" (
  for %%i in (Asudobin.exe) do %%~$PATH:i whoami
) else (
  for %%i in (Asudobin.exe) do %%~$PATH:i %*
)

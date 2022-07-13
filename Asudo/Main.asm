.386
.model flat, stdcall

include C:\masm32\include\kernel32.inc
includelib C:\masm32\include\kernel32.lib
include C:\masm32\include\user32.inc
includelib C:\masm32\include\user32.lib

.data
    hTitle db 'Win32', 0
    hMsg db 'Hello World', 0

.code
    Main:
        push 0
        push offset hTitle
        push offset hMsg
        push 0
        call MessageBoxA
        push eax
        call ExitProcess
    End Main

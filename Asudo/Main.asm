.386
.model flat, stdcall

include C:\masm32\include\kernel32.inc
includelib C:\masm32\include\kernel32.lib
include C:\masm32\include\user32.inc
includelib C:\masm32\include\user32.lib

.data
    hTitle db "Hello", 0
    executableName db 1024 dup(0)

.code
    Main:
        ; Get Module File Name Here
        push 1024
        push offset executableName
        push 0
        call GetModuleFileNameA

        ; Increase the Returned Length To Ignore Double Quotes
        inc eax
        inc eax

        ; Save to the EBX
        mov ebx, eax

        ; Get Full CLI Arguments
        call GetCommandLine

        ; EAX = CLI | EBX = FIRST ARGUMENT LENGTH
        ; ECX = CLI + LENGTH
        ; For Example, ["C:\thing.exe" aaa bbb] -> [aaa bbb]
        lea ecx, [eax + ebx]

        ; A Code for Debug
        push 0
        push offset hTitle
        push ecx
        push 0
        call MessageBoxA

        jmp Exit

        Exit:
            push 0
            call ExitProcess
    End Main

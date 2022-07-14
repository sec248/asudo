.386
.model flat, stdcall

include \masm32\include\masm32rt.inc

.data
    runMode db "runas", 0
    commandName db "cmd", 0
    shellCommand db '/k cd "', 0
    shellAnd db '" && ', 0
    combinedCommand db 2048 dup(?)
    programDir db 1024 dup(0)

.code
    Main:
        ; "Asudo" Length
        mov ebx, 5

        ; Get Full CLI Arguments
        call GetCommandLine

        ; EAX = CLI | EBX = FIRST ARGUMENT LENGTH
        ; ESI = CLI + LENGTH
        ; For Example, ["C:\thing.exe" aaa bbb] -> [aaa bbb]
        lea esi, [eax + ebx]

        ; Save Current Path
        push offset programDir
        push 1024
        call GetCurrentDirectory

        ; Concat Strings
        push offset shellCommand
        push offset combinedCommand
        call szCatStr

        push offset programDir
        push offset combinedCommand
        call szCatStr

        push offset shellAnd
        push offset combinedCommand
        call szCatStr

        push esi
        push offset combinedCommand
        call szCatStr

        ; Call Shell Execute
        push 1
        push 0
        push offset combinedCommand
        push offset commandName
        push offset runMode
        push 0
        call ShellExecute

        ; Exit
        push 0
        call ExitProcess
    End Main

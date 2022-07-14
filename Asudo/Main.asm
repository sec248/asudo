.386
.model flat, stdcall

include \masm32\include\masm32rt.inc

.data
    ; Constants
    runMode db "runas", 0
    commandName db "cmd", 0
    shellCommandIfK db '/k cd "', 0
    shellCommandIfC db '/c cd "', 0
    shellAnd db '" && ', 0
    errorFirstParameter db "Can't find first parameter or parameter is bad formatted. (must be 'k' or 'c')", 10, 0
    errorSecondParameter db "You must give a command to run.", 10, 0
    ; Changes in Runtime
    combinedCommand db 2048 dup(?)
    programDir db 2048 dup(?)
    firstParameter db 2048 dup(?)
    secondParameter db 2048 dup(?)

.code
    Main:
        ; Get 1st Argument (After Program Name)
        push offset firstParameter
        push 1
        call GetCL

        ; Get Length of First Parameter
        push offset firstParameter
        call StrLen

        ; Check if it is Bad Formatted
        .if eax != 1
            push offset errorFirstParameter
            call StdOut

            push 1
            call ExitProcess
        .endif

        ; Get 2nd Argument (Actual Command)
        push offset secondParameter
        push 2
        call GetCL

        ; Get Length of Second Parameter
        push offset secondParameter
        call StrLen

        ; Check if it is Empty
        .if eax == 0
            push offset errorSecondParameter
            call StdOut

            push 1
            call ExitProcess
        .endif

        ; Save Current Path
        push offset programDir
        push 2048
        call GetCurrentDirectory

        ; Concat Strings
        ; Check Argument
        .if BYTE PTR [firstParameter] == 99
            push offset shellCommandIfC
            push offset combinedCommand
            call szCatStr
        .elseif BYTE PTR [firstParameter] == 107
            push offset shellCommandIfK
            push offset combinedCommand
            call szCatStr
        .else
            push offset errorFirstParameter
            call StdOut

            push 1
            call ExitProcess
        .endif

        push offset programDir
        push offset combinedCommand
        call szCatStr

        push offset shellAnd
        push offset combinedCommand
        call szCatStr

        push offset secondParameter
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

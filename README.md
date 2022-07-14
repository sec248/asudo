# Asudo
A simple, minimal and limited sudo command for Windows. Written in x86 Assembly and the executable size is around ~4kb

Use masm32 to compile.

## Features
- Sets directory before executing
- Supports x86 and x86_64
- Works

## Limitations
- Argument length must be less than 2kb
- No configurations like sudo

## Installation
Download the latest binaries from **Releases** and add folder to the PATH.

- `asudo powershell`
- `asudo notepad`
- `asudo echo hello`

Asudo takes arguments as raw arguments. If `cmd` can run it, so asudo can.

## License
Asudo is licensed with the MIT license.
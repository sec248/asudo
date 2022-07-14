# Asudo
A simple, minimal and limited sudo command for Windows. Written in x86 Assembly and the executable size is around ~4kb

Use masm32 to compile.

## Features
- Sets directory before executing
- Supports x86 and x86_64
- Works

## Limitations
- Max command length is 2kb (2048 byte). For bigger commands, run a batch file.
- No configurations like sudo
- Designed for CMD and PowerShell.

## Installation
Download the latest binaries from **Releases** and add folder to the PATH.

## Usage
First parameter only can be `c` or `k`
- `c`: Closes after execute
- `k`: Keeps after execute

Next parameter is the command will run, must be in quotes if your command includes space.

Example usage(s):
- `asudo c powershell`
- `asudo c notepad`
- `asudo c "echo hello"`
- `asudo k "echo hello"`

## License
Asudo is licensed with the MIT license.
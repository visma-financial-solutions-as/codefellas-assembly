# X86_64 Assembly quick introduction

Asm is a block language, running each instruction in order. 
What an instruction does, depends on the current state of the processor (registers).
It is imperative to keep a mental note of how the state of each register while writing and debugging code.

## Basic instruction

An instruction has this format :

    instruction [[operand], ...]

The result of the instruction is stored in registers or memory according to documentation

## Dialects

There are two primary dialects; Intel and AT&T.

AT&T looks something like this :

```asm
    mov $0x2a, %rbx
```

And the equivalent Intel looks something like this :

```asm
    mov rbx, 0x2a
```

Notice that the order of operands for Intel is inverse of AT&T.

## Strings in assembly

Assembly has a concept of "string", but it's not the same thing as string in higher level languages.
A string in assembly just means a sequence of sequential data. Not necessarily text. `movs` for example means copy string, but it refers to string
as a sequence of data (byte, word, dword, qword etc)

## What is an assembly file?

Instead of thinking of the assembly as "source code", it's better thought of more like a human readable representation of how a memory area should look like.

This is important to know in order to understand why things are the way they are. There are no "variables" in assembly, there are only memory locations.
A symbol is a name for a location in memory, not a "variable" or "function".

For example consider this line :

```asm
message db "Hello World"
```

This does not define a constant or a variable. It tells the compiler that at this location there's a symbol called `message` that are bytes (`db`) and contains the string of bytes represented by the literal "Hello World". The compiler then keeps track of that memory location and inserts that string. So when you refer to `message` you're simply referring to that address.

Labels are the same thing; `mylabel:` is a symbol that is just a memory location. `jmp mylabel` means the CPU will change the instruction pointer to point to that address.

Sections (for example `section .text`) defines a part of the file that should be arranged together. It's a way of grouping data. How sections are handled depends on the linker.
For this exercise we only use `.text` and `.data`.

Example structure of an assembly file :

```asm
global main
section .data
myvar db "test"
myvar_len equ $ - myvar
section .text
main:
```

The instruction `global main` tells the compiler that the symbol `main` should be exported.
`section .data` means we're defining a section that can be read and written to
`myvar db "test"` means we're defining a a symbol called "myvar" which is a sequence of bytes, containing the literal "test"
`myvar_len equ $ - myvar` means we're defining a symbol of native size that takes the address of the current position (`$`) and subtracts the address of the symbol `myvar` effectively giving the length of the string `myvar`.
`section .text` means we're defining a section that's going to contain code (may be read-only)
`main:` defines the symbol "main" that is being exported by the `global main` instruction.

This can be compiled and built as a memory representation by the compiler.

The linker can use the exported symbol (`main`) as an entry point.

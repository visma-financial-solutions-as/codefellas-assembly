# The coding fellowship of the digital basics and other expressions of technologically heretical ideas and their iterable implementation as a tenable instrument of arrogant recklessness for incontrovertible promotion of clinical degeneracy in software

The goal is to write a program that outputs the lyrics of "99 bottles of beer".
It doesn't have to be efficient, it doesn't have to work perfectly, but it should work.

Begin by writing a hello world application by typing in the code presented in `main.asm` as a reference

Criteria :
  - __No copy pasting allowed for any reason__
  - No external dependencies, no libraries allowed - standard or otherwise
  - Must produce the strings programatically; making it output the entire lyrics by one massive hardcoded string is not allowed
  - The application should not segfault.
  - `01` is acceptable
  - Use Intel syntax (not AT&T)
  - Have fun


Lyrics :

  n bottles of beer on the wall, n bottles of beer.
  Take one down, pass it around, n-1 bottles of beer on the wall.

Repeat from 99-0

When it reaches zero, the last stanza should read 

  No more bottles of beer on the wall, no more bottles of beer.
  Go to the store and buy some more, 99 bottles of beer on the wall

This repository contains the necessary basic tools to compile and link assembly files

# Heh, ok what tools?

Well, `gcc` (C compiler, and compiliation toolchain), `vim` (text editor), `gdb` (Gnu Debugger), and `nasm` (Network Assembler)

You're free to install anything else you want

# Ok so what

Building an application is done in two steps :
  - Compiling source code
  - Linking symbols

# What are you talking about

Hmm.. Ok, so compiling an application just means producing an executable output. Something referred to as an `object`. An object contains a list of something else called `symbols`. A symbol is a label for something interesting inside an object file - usually executable code. A symbol is effectively a label for an address for something inside an object

# What does that have to do with me

I thought it might be interesting.
Anyways, disregarding your rude inquiry of disinterest for the moment,
in order to produce an executable file (like `exe`, or in this case `ELF64`), we need to link the relevant symbols together and set an entrypoint. And then we can run the program.

# Ok whatever

...Yah, so the first command after you have produced an assembly source is to compile it using `nasm`. We target a 64 bit architecture; namely `x86_64` or commonly `AMD64`. It is named as such as it inherits from what's referred to as x86, which is an instruction set that goes back to 8086 processors. So instead of saying, "8086, 286, i386, 486SX, 486DX, 586, Pentium Pro" etc, we just say x86. When 64-bit architectures were introduced for PC's there were two competing architectures; Intel Itanium and AMD64. Intel Itanium was a completely new architecture that didn't support 32-bit (or 16-bit) code and required emulation for that. So AMD64 won because it could natively execute 32-bit and 16-bit without a software emulation layer. Although awesome at the time, it's largely considered technical debt today.

Ok, so that was a digression. Anyways, we compile to AMD64. We then link the output and produce an ELF64 binary using `ld`.

Like so :

```bash
nasm -f elf64 "main.asm" -o "main.o"
```

(Notice I don't have to specify "AMD64" as normally a compiler targets the platform its running on. If it doesn't, it's referred to as a "cross-compiler")

Where the file we want to compile is called `main.asm` and the output object is called `main.o`

After that we link;

```bash
ld -e "main" -m elf_x86_64 -o "main" "main.o"
```

That's it, let's gooooo

# Well ok how then

Clone the repo, run `init.ps1` to build the docker image, and then `start.ps1` to run the docker image with a persistent volume

# Thanks, I guess

You're most welcome

# Addendum

The goal of the practice is to write in assembly a program to prints out the lyrics of "99 bottles of beer", as mentioned.
Use your best googlefu to figure out how (but don't google solutions)
Hints for instructions :

    mov : Copies a value from one place to another
    sub : Subtracts one value from another
    div : Divides the A register with the operand (read the documentation!)
    cmp : Compares one value to another
    jnz : Jump if not zero
    or : bitwise or
    xor : Invert bits
    call : Call a procedure
    ret : return from a procedure
    syscall : make a system call to the operating system

Hints for ascii :
The bitmask `00110000` will turn a _number_ to a character. `00110001` is the character `1` for instance

General hints :
Read the documentation thougherly for each instruction. If something is wrong, it's 100% because you missed something important.
Keep in mind that the behavior of an instruction depends on the operands. `div bl` does something very different than `div rbx` for example. Maybe it's the former you want?

The exercise is intended to let you learn as you go along, and not provide the ready-made solution or too much help.

If you're unfamiliar with Assembly then this is going to be an extremely frustrating and difficult task, even though it seems simple.
But it's when you do things you experience as difficult and unfamiliar that you learn things.

#### Requirements

  - Docker
  - PowerShell (or write the commands yourself)
  - Patience
  - A curious demeanor

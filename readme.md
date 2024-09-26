# The coding fellowship of the digital basics and other expressions of technologically heretical ideas and their iterable implementation as a tenable instrument of arrogant recklessness for incontrovertible promotion of clinical degeneracy in software

This repository contains the necessary basic tools to compile and link assembly files

# What tools?

Well, `gcc` (C compiler, and compiliation toolchain), `gdb` (Gnu Debugger), and `nasm` (Network Assembler)

# Ok so what

Building an application is done in two steps :
  - Compiling source code
  - Linking symbols

# What are you talking about

Hmm.. Ok, so compiling an application just means producing an executable output. Something referred to an `object`. An object contains a list of something else called `symbols`. A symbol is a label for something interesting inside an object file - usually executable code

# What does that have to do with me

I thought it might be interesting.
Anyways, disregarding your rude and inquiry of disinterest for the moment,
in order to produce an executable file (like `exe`, or in this case `ELF64`), we need to link the relevant symbols together and set an entrypoint. and then we can run the program.

# Ok whatever

Yah, so the first command after you have produced an assembly source is to compile it using `nasm`. We target a 64 bit architecture; namely `x86_64` or commonly `AMD64`. It is named as such as it inherits from what's referred to as x86, which is an instruction set that goes back to 8086 processors. So instead of saying, "8086, 286, i386, 486SX, 486DX, 586, Pentium Pro" etc, we just say x86. When 64-bit architectures were introduced for PC's there were two competing architectures; Intel Itanium and AMD64. Intel Itanium was a completely new architecture that didn't support 32-bit (or 16-bit) code and required emulation. So AMD64 "won" because it could natively execute 32-bit and 16-bit without an software emulation layer. Although awesome at the time, it's technical debt today.

Ok, so that was a digression. Anyways, we compile to AMD64. We then link the output and produce an ELF64 binary using `ld`.

Like so :

```bash
nasm -f elf64 "main.asm" -o "main.o"
```

Where the file we want to compile is called `main.asm` and the output object is called `main.o`

After that we link;

```bash
ld -e "main" -m elf_x86_64 -o "main" "main.o"
```

That's it, let's gooooo

# Well ok how then

Clone the repo, run `init.ps1` to build the docker image, and then `run.ps1` to run the docker image with a persistent volume

# Thanks, I guess

You're most welcome
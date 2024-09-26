#!/bin/bash
nasm -f elf64 "./main.asm" -o "main.o"
ld -e main -m elf_x86_64 -o "main" "main.o"
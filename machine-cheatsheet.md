# Data sizes

Byte: 1 byte (8 bits)
Word: 2 bytes (16 bits)
Double Word: 4 bytes (32 bits)
Quadruple Word: 8 bytes (64 bits)

In assembly, for data segments they use : `db` (data byte), `dw` (data word), `ddw` (data double word), `dqw` (data quadruple word)


# Registers

The CPU has a series of temporary storage variables referred to as registers.
These are normally the size of the CPU architecture (64-bit in our case).
They are each stored in a union, meaning many can be accessed in different sizes, 64, 32, 16, and 8 bits.
Accessing the 16-bit of RAX for instance (AX) will retrieve only the 16 lower bits of the registers.
Registers are the fastest to access.

Here's a quick summary :

64-bit - 32-bit - 16-bit - 8-bit high - 8-bit low

 - RAX - EAX, AX, AH, AL : Accumulator
 - RBX - EBX, BX, BH, BL : Base register
 - RCX - ECX, CX, CH, CL : Counter register
 - RDX - EDX, DX, DH, DL : Data register
 - RSI - ESI, SI : Source Index (pointer)
 - RDI - EDI, DI : Destination Index (pointer)
 - RSP - ESP, SP : Stack Pointer (pointer)
 - RBP - EBP, BP : Base Pointer (pointer)
 - R8 - R8D, R8W : General purpose
 - ... R15

And then there's RIP - EIP - IP : Instruction pointer. This register is read-only. It tells what address is currently being executed

## Segment registers

In the before-time, in the long-long ago, computers were 16-bit and addresses were handled a bit differently.
On 16-bit Intel architectures, each pointer uses two registers; a segment and an offset (index). They are usually represented as `[Segment:Offset]` for example `[DS:SI]`. Without getting way too far into the technical, the addresses were computed by bit-shifting the offset by 4 bits, and adding it to the segment, producing a 20-bit address. So pointers on old computers were stored in code as either as a 16 bit address (near pointer) or 32-bit (far pointer).

Segment registers are still there, but they are 16-bit only.

 - CS : Code segment (code executing)
 - DS : Data segment (data code is reading from)
 - SS : Stack segment (stack space)
 - ES : Extra segment (well, extra..)
 - FS : No particular reason
 - GS : Ditto


# Instructions

Keep in mind that Intel assembly instructions goes `[target] [source]`, so the first operand is usually the target for an instruction

# Processor flags

Processor flags are populated as a result of an operation

These are (affectionately referred to as `RFLAGS` among fellow ~~robots~~ humans) :

  - CF : Carry
  - PF : Parity
  - AF : Auxiliary carry
  - ZF : Zero
  - SF : Sign
  - TF : Trap
  - IF : Interrupt enable
  - DF : Direction
  - OF : Overflow
  - IOPL : I/O Privilege level
  - NT : Nested Task
  - RF : Resume
  - VM : Virtual 8086 mode
  - AC : Alignment check / Access control
  - VIF : Virtual Interrupt
  - VIP : Virtual Interrupt pending
  - ID : ID (no idea)

And tons more, let's not delve too deep

# Some useful instructions

In these listings, `a` and `b` represent operands, not literally a or b. What can be used in `a` or `b` depends on the instruction in question

 - `mov b, a` : copies a value from a to b
 - `add b, a` : Adds two integer values (yes, integers) and stores the value in b
 - `adc b, a` : Adds two integers and sets carry flag if the addition carries
 - `sub b, a` : subtracts two integer values
 - `fadd b, a` : Floating point add
 - `cmp b, a` : compares two values and populates CPU flags to indicate the result (zero and equal for instance)
 - `push a` : Pushes the value of `a` onto the stack
 - `pop a` : Pops the value on top of the stack and stores it in `a`
 - `jmp a` : Unconditional jump to address stored in `a`
    - `je` : Jump if value is equal (result of `cmp` setting the equal flag to true for instance)
    - `jg` : Jump if greater
    - `jge` : Jump if greater or equal
    - `jl` : Jump if lesser
    - `jc` : Jump if carry
    - etc. you get the drill
 - `call a` : Pushes the current value of the instruction pointer, and jumps to the address referred to by `a`
 - `int a` : Raises an interrupt at interrupt vector `a`
 - `syscall` : Unix-specific, calls the interrupt vector `0x80`
 - `ret` : returns to the address stored by `call`

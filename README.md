# Hello World in s390x Assembly (Linux)

A simple Hello World implementation in IBM System z (s390x) assembly language for Linux systems. The s390x architecture represents IBM's mainframe lineage, designed for high-reliability computing environments with a focus on data processing and I/O operations.

## Installation

On an s390x Linux system, you'll need the standard GNU toolchain:

```bash
sudo apt-get update
sudo apt-get install binutils gcc
```

## Running

Assemble and link:
```bash
as -o main.o main.s
ld -o hello main.o
./hello
```

## Code Explanation

The s390x architecture represents a different design philosophy from the RISC architectures we often see in modern systems. As a CISC (Complex Instruction Set Computing) architecture, it includes many sophisticated instructions and addressing modes, though our simple example only uses a few basic ones.

The implementation demonstrates several key aspects of s390x assembly:

Register Usage:
- General purpose registers are named %r0 through %r15
- %r1 holds the system call number
- %r2 through %r4 hold system call parameters
- Register pairs can be used for 128-bit operations (though not shown in this example)

Instructions Used:
- lghi (Load Halfword Immediate): Loads a 16-bit value into a 64-bit register with sign extension
- larl (Load Address Relative Long): Loads an address using PC-relative addressing
- svc (Supervisor Call): Makes a system call

Memory and Alignment:
- The .align 8 directive ensures 8-byte (64-bit) alignment
- The .section directive separates code (".text") from read-only data (".rodata")
- s390x uses big-endian byte ordering

System Call Convention:
- System call numbers are passed in %r1
- Parameters are passed in registers %r2 through %r7
- The svc 0 instruction triggers the system call

The s390x architecture has several unique characteristics:
- Support for both 31-bit and 64-bit addressing modes
- Hardware decimal arithmetic support
- Sophisticated I/O subsystem
- Built-in virtualization support
- Hardware-assisted cryptography

While our simple example doesn't showcase many of these advanced features, they make s390x particularly well-suited for its traditional role in enterprise computing, especially for tasks involving large-scale data processing and transaction handling.

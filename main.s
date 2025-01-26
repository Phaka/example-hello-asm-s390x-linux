# IBM s390x assembly for Linux
# System calls for s390x Linux:
# 4 for write
# 1 for exit

        .section ".text"
        .align 8
        .global _start
_start:
        # Write system call
        lghi    %r1,4           # System call number for write
        lghi    %r2,1           # File descriptor 1 is stdout
        larl    %r3,message     # Load address of message
        lghi    %r4,14          # Message length
        svc     0               # Make system call

        # Exit system call
        lghi    %r1,1           # System call number for exit
        lghi    %r2,0           # Return code 0
        svc     0               # Make system call

        .section ".rodata"
        .align 8
message:
        .ascii "Hello, World!\n"

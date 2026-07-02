## makefile for testing preemptive multithreading
#
# This assumes you have SDCC installed and targets EdSim51.
# The generated .hex file can be loaded directly into EdSim51.
#

CC = sdcc
CFLAGS = -c
LDFLAGS =

C_OBJECTS = testpreempt.rel preemptive.rel

all: testpreempt.hex

testpreempt.hex: $(C_OBJECTS)
	$(CC) $(LDFLAGS) -o testpreempt.hex $(C_OBJECTS)

clean:
	powershell -NoProfile -Command "Remove-Item -ErrorAction SilentlyContinue *.hex,*.ihx,*.lnk,*.lst,*.map,*.mem,*.rel,*.rst,*.sym,*.asm,*.lk"

%.rel: %.c preemptive.h Makefile
	$(CC) $(CFLAGS) $<
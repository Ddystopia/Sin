.PHONY: all clean

CC=nasm
CFLAGS=-f elf
LFLAGS=-m elf_i386 -s
OUTPUT=run
SOURCES=main.asm

OBJECTS=$(SOURCES:.asm=.o)

all: run

run: $(OBJECTS)
	ld $(LFLAGS) -o $(OUTPUT) $^

%.o: %.asm
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -rf $(OUTPUT) *.o

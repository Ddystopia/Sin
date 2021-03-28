.PHONY: all clean

OUTPUT=sin
OBJECTS=main.o sin.o

all: run

run: $(OBJECTS)
	gcc -lm $^ -o $(OUTPUT)

%.o: %.asm
	as $< -o $@
	
%.o: %.c
	gcc -c $< -o $@

clean:
	rm -rf $(OUTPUT) *.o

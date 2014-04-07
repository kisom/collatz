TARGETS = collatz-c collatz-hs collatz-go
CFLAGS = -Wall -Werror -std=c99 -D_XOPEN_SOURCE=700 -D_BSD_SOURCE=1 -O3

all: $(TARGETS)

collatz-c: collatz.c
	$(CC) $(CFLAGS) -o $@ collatz.c
	strip $@

collatz-hs: collatz.hs
	ghc --make collatz.hs -o $@

collatz-go: collatz.go
	go build -o $@ collatz.go

clean:
	rm -f $(TARGETS) *.o *.hi tags

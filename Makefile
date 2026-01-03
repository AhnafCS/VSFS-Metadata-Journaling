CC = gcc
CFLAGS = -Wall -g

all: journal mkfs validator

journal: journal.c vsfs.h
	$(CC) $(CFLAGS) journal.c -o journal

mkfs: mkfs.c vsfs.h
	$(CC) $(CFLAGS) mkfs.c -o mkfs

validator: validator.c vsfs.h
	$(CC) $(CFLAGS) validator.c -o validator

clean:
	rm -f journal mkfs validator vsfs.img
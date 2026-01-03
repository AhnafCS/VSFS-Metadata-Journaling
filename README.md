# VSFS Metadata Journaling

A C implementation of metadata journaling for a Simple File System (VSFS). 
This project ensures crash consistency by logging metadata updates 
(bitmaps, inodes, and directory blocks) to a journal before installing 
them to their home locations.

## How to Run
1. Build everything: `make`
2. Initialize the disk: `./mkfs`
3. Log a change: `./journal create <filename>`
4. Apply changes: `./journal install`
5. Verify consistency: `./validator`
6. Clean up: `make clean`

Shortcut: 
```bash
make && ./mkfs && ./journal create testfile && ./journal install && ./validator
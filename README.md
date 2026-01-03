# VSFS Metadata Journaling

A C implementation of metadata journaling for a Simple File System (VSFS). 
This project ensures crash consistency by logging metadata updates 
(bitmaps, inodes, and directory blocks) to a journal before installing 
them to their home locations.

## How to Run
1. Compile the code: `gcc journal.c -o journal -Wall`
2. Create the FS: `./mkfs`
3. Log a change: `./journal create <filename>`
4. Apply changes: `./journal install`
5. Verify consistency: `./validator`
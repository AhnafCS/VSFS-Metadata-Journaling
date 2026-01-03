# VSFS Metadata Journaling

A C implementation of metadata journaling for a Simple File System (VSFS). 
This project ensures crash consistency by logging metadata updates 
(bitmaps, inodes, and directory blocks) to a journal before installing 
them to their home locations.


The file system is stored in a static 340 KB disk image (vsfs.img) with the following structure:
| Component | Blocks | Index | Description |
| :--- | :--- | :--- | :--- |
| **Superblock** | 1 | 0 | FS metadata (Magic #, sizes) |
| **Journal** | 16 | 1 - 16 | Transaction logs for crash recovery |
| **Inode Bitmap** | 1 | 17 | Tracking free/used inodes |
| **Data Bitmap** | 1 | 18 | Tracking free/used data blocks |
| **Inode Table** | 2 | 19 - 20 | Metadata for every file |
| **Data Blocks** | 64 | 21 - 84 | Actual file and directory data |
Total 85 blocks (4 KB per block).

## How to Run
1. Build everything: `make`
2. Initialize the disk: `./mkfs`
3. Log a change: `./journal create <filename>`
4. Apply changes: `./journal install`
5. Verify consistency: `./validator`
6. Clean up: `make clean`

Shortcut: 
```bash
<<<<<<< HEAD
make && ./mkfs && ./journal create testfile && ./journal install && ./validator
=======
make && ./mkfs && ./journal create testfile && ./journal install && ./validator
>>>>>>> c1084920be9b236835fd9727bf78afc7102e0c00

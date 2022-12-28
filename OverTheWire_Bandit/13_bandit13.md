The password for bandit13 is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed.

Due to permissions issues, we cannot modify the contents of the file within the home directory. OverTheWire recommends to create a temporary working directory within /tmp which will have permissions for us to play around with the file in question. 

**`bandit12@bandit:~$ mkdir /tmp/rajh`**  

Now, let's copy the text file to our new directory...

**`bandit12@bandit:~$ cp data.txt /tmp/rajh`** 

...and then navigate over to that new directory and verify the file is there. 

**`bandit12@bandit:~$ cd /tmp/rajh`**  
**`bandit12@bandit:/tmp/rajh$ ls`**  
*`data.txt`*  

Now let's begin the decompression process. The instructions say the file is initially a hexdump:

**`bandit12@bandit:/tmp/rajh$ xxd -r data.txt > data2`**  
**`bandit12@bandit:/tmp/rajh$ file data2`**  
*`data2: gzip compressed data, was "data2.bin", last modified: ......`*  

The data now seems to be compressed via gzip.

**`bandit12@bandit:/tmp/rajh$ zcat data2 > data3`**  
**`bandit12@bandit:/tmp/rajh$ file data3`**  
*`data3: bzip2 compressed data, block size = 900k`*

The data is now a compressed via bzip2.

**`bandit12@bandit:/tmp/rajh$ bzip2 -d data3`**  
*`bzip2: Can't guess original name for data3 -- using data3.out`*  
**`bandit12@bandit:/tmp/rajh$ file data3.out`**  
*`data3.out: gzip compressed data, was "data4.bin", last modified: .....`*

Yet another gzip compression. Rinse and repeat. 

**`bandit12@bandit:/tmp/rajh$ zcat data3.out > data4`**  
**`bandit12@bandit:/tmp/rajh$ file data4`**  
*`data4: POSIX tar archive (GNU)`*

Ah, a tarball! Something new, at least. 

**`bandit12@bandit:/tmp/rajh$ tar -xvf data4`**  
*`data5.bin`*  
**`bandit12@bandit:/tmp/rajh$ file data5.bin`**  
*`data5.bin: POSIX tar archive (GNU)`*  
**`bandit12@bandit:/tmp/rajh$ tar -xvf data5.bin`**  
*`data6.bin`*  
**`bandit12@bandit:/tmp/rajh$ file data6.bin`**  
*`data6.bin: bzip2 compressed data, block size = 900k`*  
**`bandit12@bandit:/tmp/rajh$ bzip2 -d data6.bin`**  
*`bzip2: Can't guess original name for data6.bin -- using data6.bin.out`*  
**`bandit12@bandit:/tmp/rajh$ file data6.bin.out`**  
*`data6.bin.out: POSIX tar archive (GNU)`*  
**`bandit12@bandit:/tmp/rajh$ tar -xvf data6.bin.out`**  
*`data8.bin`*  
**`bandit12@bandit:/tmp/rajh$ file data8.bin`**  
*`data8.bin: gzip compressed data, was "data9.bin", last modified: .......`*  
**`bandit12@bandit:/tmp/rajh$ zcat data8.bin`**  
*`The password is wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw`*  

Good lord, finally. 

**`bandit12@bandit:/tmp/rajh$ ssh bandit13@localhost -p 2220`**  
*`bandit13@localhost's password:`* wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw

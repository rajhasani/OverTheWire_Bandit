OverTheWire gives a long description here of the puzzle, but to make a long story short: 

* The contents of the file containing the password (*`krypton3`*) are encrypted using a Caesar cipher, which shifts the alphabet by a set number. 
  * A ROT13 cipher is, in essence, a Caeser cipher, where the set number the alphabet is shifted by is 13. 
* There is a binary (*`encrypt`*) in the directory that will encrypt whatever sample text/file you pass to it with the same Caesar cipher used on the password file
* The keyfile needs to be present in the current working directory, i.e. wherever your sample file resides. 
  * The binary, apparently, does not, but will attempt to reference the keyfile and sample file within the same directory
* The binary runs as user/setuid krypton3, so ensure your working directory has adequate permissions to be written to

Let's get this going: 

**`krypton2@bandit:~$ cd /krypton/krypton2`**  
**`krypton2@bandit:/krypton/krypton2$ ls`**  
*`encrypt  keyfile.dat  krypton3  README`*  

Since we cannot write to the /krypton/krypton2 directory, we will need to create a temp directory to create the sample file to pass to the binary, and appropriately set the permissions:

**`krypton2@bandit:/krypton/krypton2$ mkdir /tmp/rajh`**  
**`krypton2@bandit:/krypton/krypton2$ chmod 777 /tmp/rajh`**  
**`krypton2@bandit:/krypton/krypton2$ cp keyfile.dat /tmp/rajh `**  
*`cp: cannot open 'keyfile.dat' for reading: Permission denied`*

Hmm, so we can't write our sample phrase to /krypton/krypton2, and we can't export the keyfile out of /krypton/krypton2. What we can do, however, is create a symbolic link within our temp directory to the keyfile. 

**`krypton2@bandit:/krypton/krypton2$ cd /tmp/rajh`**  
**`krypton2@bandit:/tmp/rajh$ ln -s /krypton/krypton2/keyfile.dat`**  
**`krypton2@bandit:/tmp/rajh$ ls`**  
*`keyfile.dat`*

Nice, now that it's in there, let's get our sample going. We want a clear way to associate whatever we pass to the *`encrypt`* binary with its output:

**`krypton2@bandit:/tmp/rajh$ echo "ABCDEFGHIJKLMNOPQRSTUVWXYZ" > sample.txt`**  
**`krypton2@bandit:/tmp/rajh$ ls`**  
*`keyfile.dat  sample.txt`*  
**`krypton2@bandit:/tmp/rajh$ /krypton/krypton2/encrypt sample.txt`**  
**`krypton2@bandit:/tmp/rajh$ ls`**  
*`ciphertext  keyfile.dat  sample  sample.txt`*  
**`krypton2@bandit:/tmp/rajh$ cat ciphertext`**  
*`MNOPQRSTUVWXYZABCDEFGHIJKL`*  

Seems like the characters have been rotated by 12 positions. Using the translate command: 

**`krypton2@bandit:/tmp/rajh$ cat /krypton/krypton2/krypton3 | tr [M-ZA-L] [A-Z]`**  
*`CAESARISEASY`*

Note how the range placement in the *`tr`* example above differs from the one we used in the previous level. This is because a ROT13 is symmetric, i.e. an A becomes an N, which becomes an A again, all because the alphabet is 26 letters. With a rotation of 12 however, A would become M, which if ran again, would become Y, etc etc. We must define the input set/range **as the text we are attempting to translate**, and the output set/range as **the proper translation format of the text**. That is to say, in the example above where the text has already been encrypted with the Caesar cipher, we are telling *`tr`* to translate M ***back*** to an A, and so on so forth.

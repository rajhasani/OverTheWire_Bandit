***The password for level 2 is in the file ‘krypton2’. It is ‘encrypted’ using a simple rotation. It is also in non-standard ciphertext format. When using alpha characters for cipher text it is normal to group the letters into 5 letter clusters, regardless of word boundaries. This helps obfuscate any patterns. This file has kept the plain text word boundaries and carried them to the cipher text. Enjoy!***

As stated in the description for accessing krypton1, all files for the levels are located in a directory called /krypton/.

***`krypton1@bandit:~$ cd /krypton/`***  
***`krypton1@bandit:/krypton$ ls`***  
*`krypton1  krypton2  krypton3  krypton4  krypton5  krypton6`*  
***`krypton1@bandit:/krypton$ cd krypton1`***  
***`krypton1@bandit:/krypton/krypton1$ ls`***  
*`krypton2  README`*  
***`krypton1@bandit:/krypton/krypton1$ cat README`***  
```
..
.. 
The first level is easy.  The password for level 2 is in the file
'krypton2'.  It is 'encrypted' using a simple rotation called ROT13.
It is also in non-standard ciphertext format.  When using alpha characters for
cipher text it is normal to group the letters into 5 letter clusters,
regardless of word boundaries.  This helps obfuscate any patterns.

This file has kept the plain text word boundaries and carried them to
the cipher text.

Enjoy!
```

This description differs slightly than the one provided above, which is directly from the website, in that it specifies that the file is encrypted using a ROT13. We dealt with one of these in Bandit, so this *should* be straightforward.

***`krypton1@bandit:/krypton/krypton1$ cat krypton2`***  
*`YRIRY GJB CNFFJBEQ EBGGRA`*  

Take this output over to rot13.com, and we get:  
*`LEVEL TWO PASSWORD ROTTEN`*  

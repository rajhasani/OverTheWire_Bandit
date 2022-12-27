The password for bandit12 is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions.

**`bandit11@bandit:~$ ls`**  
*`data.txt`*  
**`bandit11@bandit:~$ cat data.txt`**  
*`Gur cnffjbeq vf WIAOOSFzMjXXBC0KoSKBbJ8puQm5lIEi`*

"Rotated by 13 positions" is a common "cipher" known as a "rot13". Head over to rot13.com and copy/paste the output from data.txt.

**`bandit11@bandit:~$ ssh bandit12@localhost -p 2220`**  
*`bandit12@localhost's password:`* JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv

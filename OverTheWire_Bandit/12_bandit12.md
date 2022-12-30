***The password for bandit12 is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions.***

**`bandit11@bandit:~$ ls`**  
*`data.txt`*  
**`bandit11@bandit:~$ cat data.txt`**  
*`Gur cnffjbeq vf WIAOOSFzMjXXBC0KoSKBbJ8puQm5lIEi`*

"Rotated by 13 positions" is a common "cipher" known as a "rot13". You have two options here: either head over to rot13.com and copy/paste the output from data.txt, or learn how to do this using bash. The latter option is more fun, and will require us to use the translate (*`tr`*) command. 

The syntax for the *`tr`* command is as follows:
**`tr [input set/range] [output set/range]`**

Since the characters are rotated by 13 positions, A becomes N, B becomes O, and so on. This can be expressed in the following example, which is incidentally the solution to the puzzle:

**`bandit11@bandit:~$ echo "Gur cnffjbeq vf WIAOOSFzMjXXBC0KoSKBbJ8puQm5lIEi" | tr [A-Za-z] [N-ZA-Mn-za-m]`**  
*`The password is JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv`*  

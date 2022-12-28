The password for bandit11 is stored in the file data.txt, which contains base64 encoded data.

**`bandit10@bandit:~$ ls`**  
*`data.txt`*  
**`bandit10@bandit:~$ cat data.txt`**  
*`VGhlIHBhc3N3b3JkIGlzIDZ6UGV6aUxkUjJSS05kTllGTmI2blZDS3pwaGxYSEJNCg== `*

We will need to decode the base64 encoded data.

**`bandit10@bandit:~$ base64 -d data.txt`**  
*`The password is 6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM`*  

The password for bandit14 is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level.

**`bandit13@bandit:~$ ls`**  
*`sshkey.private`*  
**`bandit13@bandit:~$ file sshkey.private`**  
*`sshkey.private: PEM RSA private key`*  

We're given a PEM file which will supposedly allow us to authenticate to bandit14. Let's give it a shot:

**`bandit13@bandit:~$ ssh -i sshkey.private bandit14@localhost -p 2220`**  
**`bandit14@bandit:~$`**  

Nice. Now that we're bandit14, we can gather the password for the current level. 

**`bandit14@bandit:~$ cat /etc/bandit_pass/bandit14`**  
*`fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq`*

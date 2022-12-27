The password for bandit7 is located "somewhere on the server" with ALL of the following attributes: **owned by user bandit7, owned by group bandit6, 33 bytes in size.** Since we do not know where exactly on the server, it would behoove us to begin by navigating out of the home directory and into the root directory. 

**`bandit6@bandit:~$ cd /`**

We are now going to want to limit our search to all three attributes provided in the prompt. 

**`bandit6@bandit:/$ find -user bandit7 -group bandit6 -size 33c`**

At this point, we are going to get a long list of files, most of which have a "find '<filepath>': Permission denied" error. Scrolling through the list, there is only one line returned which does not follow this error syntax:

*`./var/lib/dpkg/info/bandit7.password`*  
**`bandit6@bandit:/$ cat ./var/lib/dpkg/info/bandit7.password`**  
*`z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S`*  
**`bandit6@bandit:/$ ssh bandit7@localhost -p 2220`**  
*`bandit7@localhost's password:`* z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S

***The password for bandit1 is given in a readme file in the home directory.***

Extremely simple; let's gather the contents of the directory, and extract the contents of the correct file:

**`bandit0@bandit:~$ ls`**  
*`readme`*  
**`bandit0@bandit:~$ cat readme`**  
*`NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL`*  
**`bandit0@bandit:~$ ssh bandit1@localhost -p 2220`**  
*`bandit1@localhost's password:`* NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL

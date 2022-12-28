***The password is located in a file named "-" in the home directory. ***

**`bandit1@bandit:~$ ls`**  
*`-`*  

Since the filename is a symbol rather than a conventional character, we will use the ./ notation to reference the relative path to the current working directory

**`bandit1@bandit:~$ cat ./-`**  
*`rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi`*  
**`bandit1@bandit:~$ ssh bandit2@localhost -p 2220`**  
*`bandit2@localhost's password:`* rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi

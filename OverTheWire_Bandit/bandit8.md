The password for bandit8 is stored somewhere in a text file, next to the word "millionth".

**`bandit7@bandit:~$ ls`**  
*`data.txt`*

We will want to use a command that will quickly return only the line with the given word. 

**`bandit7@bandit:~$ cat data.txt | grep "millionth"`**  
*`millionth       TESKZC0XvTetK0S9xNwm25STk5iWrBvP`*  
**`bandit7@bandit:~$ ssh bandit8@localhost -p 2220`**  
*`bandit8@localhost's password:`*  TESKZC0XvTetK0S9xNwm25STk5iWrBvP

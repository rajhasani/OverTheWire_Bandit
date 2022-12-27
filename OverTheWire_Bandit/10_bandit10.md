The password for bandit10 is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.  

**`bandit9@bandit:~$ ls`**  
*`data.txt`*  

We first need to identify only the strings in the file, and then identify which of those strings begin with several "=" characters.

**`bandit9@bandit:~$ strings data.txt | grep "======"`**  
*`========== the`*  
*`========== password`*  
*`========== is=`*  
*`F========== G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s`*  
**`bandit9@bandit:~$ ssh bandit10@localhost -p 2220`**  
*`bandit10@localhost's password:`* G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s

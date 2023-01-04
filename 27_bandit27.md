***Good job getting a shell! Now hurry and grab the password for bandit27!***

We should still be logged into bandit26 with a shrunk terminal window. Similar to the solution for obtaining the password to bandit20, use the setuid binary to perform commands as bandit27:

**`bandit26@bandit:~$ ls`**  
*`bandit27-do text.txt`*  
**`bandit26@bandit:~$ ./bandit27-do`**  
*`Run a command as another user.`*  
*`  Example: ./bandit27-do id`*  
**`bandit26@bandit:~$ ./bandit27-do cat /etc/bandit_pass/bandit27`**  
*`YnQpBuifNMas1hcUFk70ZmqkhUU2EuaS`*  

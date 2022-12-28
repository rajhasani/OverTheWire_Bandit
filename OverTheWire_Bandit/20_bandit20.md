***To gain access to bandit20, you should use the setuid binary in the homedirectory. Execute it without arguments to find out how to use it. The password for this level can be found in the usual place (/etc/bandit_pass), after you have used the setuid binary.***

Let's first take a look at the contents of our home directory:

**`bandit19@bandit:~$ ls`**  
*`bandit20-d0`*  

The prompt states to run the setuid binary without arguments for instructions on its usage:

**`bandit19@bandit:~$ ./bandit20-do`**  
*`Run a command as another user.`*  
*`  Example: ./bandit20-do id`*  

So we can run a command as bandit20, AND we are reminded of the location of all the passwords for each respective user. Put those two factoids together and...:

**`bandit19@bandit:~$ ./bandit20-do cat /etc/bandit_pass/bandit20`**  
*`VxCazJaVykI6W36BkBU0mJTCM8rR95XT`*  

Nice. Now I wonder if this setuid binary is permission-specific to bandit20@localhost, or if I can go further; let's test it out:

**`bandit19@bandit:~$ ./bandit20-do cat /etc/bandit_pass/bandit21`**  
*`cat: /etc/bandit_pass/bandit21: Permission denied`*

Shame.... anyways we have the password for bandit20, so we can proceed nonetheless.

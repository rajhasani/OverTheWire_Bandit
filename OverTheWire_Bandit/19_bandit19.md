***The password for bandit19 is stored in a file readme in the homedirectory. Unfortunately, someone has modified .bashrc to log you out when you log in with SSH.***

This was the issue I was referring to in the previous post; when we attempt to authenticate, it will automatically log us out. However, since the password is within the readme file right in the home directory, we can append a command to output the contents of the file right after our connection command:

**`bandit17@bandit:~$ ssh bandit18@localhost -p 2220 cat readme`**  
```
..
..
awhqfNnAbc1naukrpqDYcF95h7HoMTrC
```

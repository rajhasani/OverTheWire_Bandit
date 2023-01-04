***There are 2 files in the homedirectory: passwords.old and passwords.new. The password for bandit18 is in passwords.new and is the only line that has been changed between passwords.old and passwords.new***

We need to use a command that will only highlight the differences between the two files: 

**`bandit17@bandit:~$ diff passwords.old passwords.new`**
```
42c42
< U79zsNCl1urwJ5rU6pg7ZSCi7ifWOWpT 
---
> hga5tuuCLF6fFzUpnagiMN8ssu9LFrdg
```

Looking at the differential, the first line was taken out (<) and the second line was entered in (>). 

NOTE: Attempting to authenticate to bandit18 using the credentials above gives us a "connection closed" error. This is part of the next level.

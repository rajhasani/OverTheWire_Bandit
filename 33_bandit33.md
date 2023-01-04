***After all this* git *stuff its time for another escape. Good luck!***

Upon logging into bandit32, we're greeted with a message: 

```
WELCOME TO THE UPPERCASE SHELL
>>
```

When trying to interact with this shell:

```
>> ls
sh: 1: LS: not found
```

So this shell converts all input into uppercase; since terminal commands are case-sensitive, this will not work for us. Fortunately, there is an easy way to escape the interactive mode of the shell:

```
>> $0
$
```

We now have regular shell access. Double-checking the assigned shell for bandit32:

**`$ cat /etc/passwd | grep bandit32`**  
*`bandit32:x:11032:11032:bandit level 32:/home/bandit32:/home/bandit32/uppershell`*  

I'll admit that I was a bit stumped at this point. After toying around within the shell for some time, I decided to get some details on the shell itself:

**`$ ls -al`**  
```
total 36
drwxr-xr-x  2 root     root      4096 Dec  3 08:14 .
drwxr-xr-x 49 root     root      4096 Dec  3 08:14 ..
-rw-r--r--  1 root     root       220 Jan  6  2022 .bash_logout
-rw-r--r--  1 root     root      3771 Jan  6  2022 .bashrc
-rw-r--r--  1 root     root       807 Jan  6  2022 .profile
-rwsr-x---  1 bandit33 bandit32 15128 Dec  3 08:14 uppershell
```

Now that's interesting; even though the shell is assigned to the bandit32 group, bandit33 is the owner. This should mean that within this shell, we have the same permissions that bandit33 has. Using previous knowledge: 

**`$ cat /etc/bandit_pass/bandit33`**  
*`odHo63fHiFqcWWJG9rLiLDtPm45KzUKy`*  

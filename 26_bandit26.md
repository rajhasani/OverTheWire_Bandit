***Logging in to bandit26 from bandit25 should be fairly easy… The shell for user bandit26 is not /bin/bash, but something else. Find out what it is, how it works and how to break out of it.***

**`bandit25@bandit:~$ ls`**  
*`bandit26.sshkey`*  
**`bandit25@bandit:~$ ssh -i bandit26.sshkey bandit26@localhost -p 2220`**
```
..
..
Connection to localhost closed.
```

So the connection to bandit26 is automatically closing upon authentication. We're given a massive hint in the prompt, that the shell for a specific user is not /bin/bash. What we need is to access a list of some sort that shows the list of users and the absolute path of their respective shell. Fortunately, a file containing said list is readily available:

**`bandit25@bandit:~$ cat /etc/passwd | grep bandit26`**  
*`bandit26:x:11026:11026:bandit level 26:/home/bandit26:/usr/bin/showtext`*  

Among the various lines of output, we see that most of the bandit users do have /bin/bash as the absolute path of their shells, but bandit26 does not - rather, it is /usr/bin/showtext. 

**`bandit25@bandit:~$ cat /usr/bin/showtext`**  
```
#!/bin/sh 
export TERM=linux 
exec more ~/text.txt 
exit 0
```

Here we can see why the connection is consistently closed upon connect: the terminal emulator is set to linux, the conents of the text.txt file are displayed using the *more* command, and then auto-exits. This is the behavior of the shell used by bandit26. 

We'll have to get a bit sneaky here and exploit a feature of the *more* command. *more* is used to go through text one page at a time; however, if all the text can fit on one page, then *more* will discontinue, giving us nothing to interface with. So, we'll have to ensure that the text takes more than one "page".... by shrinking our terminal window. Once this is done, try attempting authentication into bandit26 again:

**`bandit25@bandit:~$ ssh -i bandit26.sshkey bandit26@localhost -p 2220`**

Now, once we see the ASCII art begin for bandit26, we see the *more* command view. With this view open, we can actually edit files displayed with *more* by pressing "v"

Then type in:  
**`:set shell=/bin/bash`**  
**`:sh`**

Look at that; suddenly you're in the home directory, as user bandit26. Even though we have the PEM file within bandit25, let's quickly grab the password for bandit26 anyways.

**`bandit26@bandit:~$ cat /etc/bandit_pass/bandit26`**  
*`c7GvcKlw9mC7aUQaPx7nwFstuAIBw1o1`*

While we're here, running an ls shows us a setuid binary pertaining to bandit27. This may be relevant to access bandit27, and we don't want to lose our connection to bandit26, so let's move quickly. 
